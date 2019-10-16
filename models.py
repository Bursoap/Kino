from sqlalchemy.dialects.mysql import DOUBLE
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, \
    Table, Date, TIMESTAMP, func, Boolean, Time, UniqueConstraint
from sqlalchemy.orm import relationship, backref

engine = create_engine('mysql://kino:kino@172.17.0.2/movie_rental', echo=True)

Base = declarative_base()


class Country(Base):
    __tablename__ = 'country'

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)


class Location(Base):
    __tablename__ = 'location'

    id = Column(Integer, primary_key=True)
    country_id = Column(Integer, ForeignKey('country.id'), nullable=False)
    country = relationship('Country', backref='locations')

    state = Column(String(100))
    city = Column(String(100))
    street = Column(String(100))
    number = Column(String(100))


office_department = Table(
    'office_department',
    Base.metadata,
    Column('office_id', Integer, ForeignKey('office.id')),
    Column('department_id', Integer, ForeignKey('department.id'))
)


class Office(Base):
    __tablename__ = 'office'

    id = Column(Integer, primary_key=True)
    location_id = Column(Integer, ForeignKey('location.id'), nullable=False)
    location = relationship('Location', backref='offices')

    office_head_id = Column(Integer, ForeignKey('employee.id', use_alter=True))
    office_head = relationship('Employee', backref='subordinate_offices')

    name = Column(String(50), nullable=False, unique=True)
    departments = relationship(
        'Department',
        secondary=office_department,
        back_populates='offices'
    )


class Department(Base):
    __tablename__ = 'department'

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=True, unique=True)
    offices = relationship(
        'Office',
        secondary=office_department,
        back_populates='departments'
    )


class Person(Base):
    __tablename__ = 'person'

    id = Column(Integer, primary_key=True)
    location_id = Column(Integer, ForeignKey('location.id'))
    location = relationship('Location', backref='persons')

    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    birth_date = Column(Date, nullable=False)
    death_date = Column(Date)


class Employee(Base):
    __tablename__ = 'employee'

    id = Column(Integer, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.id'),
                       nullable=False, unique=True)
    person = relationship('Person', backref=backref('employee', uselist=False))

    office_id = Column(Integer, ForeignKey('office.id'), nullable=False)
    office = relationship('Office', backref='employees')

    dept_id = Column(Integer, ForeignKey('department.id'), nullable=False)
    department = relationship('Department', backref='employees')

    title = Column(String(100), nullable=False)
    salary = Column(DOUBLE(precision=8, scale=2), nullable=False)
    active = Column(Boolean, nullable=False, default=True)
    employment_date = Column(Date, nullable=False)
    dismiss_date = Column(Date)


film_genre = Table(
    'film_genre',
    Base.metadata,
    Column('film_id', Integer, ForeignKey('film.id')),
    Column('genre_id', Integer, ForeignKey('genre.id'))
)


class Genre(Base):
    __tablename__ = 'genre'

    id = Column(Integer, primary_key=True)
    films = relationship(
        'Film',
        secondary=film_genre,
        back_populates='genres'
    )

    name = Column(String(50), nullable=False, unique=True)


film_actor = Table(
    'film_actor',
    Base.metadata,
    Column('film_id', Integer, ForeignKey('film.id')),
    Column('actor_id', Integer, ForeignKey('actor.id'))
)


class Actor(Base):
    __tablename__ = 'actor'

    id = Column(Integer, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.id'),
                       nullable=False, unique=True)
    person = relationship('Person', backref=backref('actor', uselist=False))

    films = relationship(
        'Film',
        secondary=film_actor,
        back_populates='actors'
    )

    biography = Column(String(10000))
    oscar = Column(Boolean, nullable=False, default=True)


class Rating(Base):
    __tablename__ = 'rating'

    film_id = Column(Integer, ForeignKey('film.id'), nullable=False)
    client_id = Column(Integer, ForeignKey('client.id'), nullable=False)
    rating = Column(DOUBLE(precision=2, scale=1), nullable=False)
    film = relationship('Film', back_populates='ratings')
    client = relationship('Client', back_populates='films_ratings')


class Client(Base):
    __tablename__ = 'client'

    id = Column(Integer, primary_key=True)
    person_id = Column(Integer, ForeignKey('person.id'),
                       nullable=False, unique=True)
    person = relationship('Person', backref=backref('client', uselist=False))
    films_ratings = relationship('Rating', back_populates='client')

    created = Column(TIMESTAMP, nullable=False, server_default=func.now())
    email = Column(String(100))
    active = Column(Boolean, nullable=False, default=True)


class Film(Base):
    __tablename__ = 'film'

    id = Column(Integer, primary_key=True)
    producer_id = Column(Integer, ForeignKey('person.id'), nullable=False)
    producer = relationship('Person', backref='produced_films')

    country_id = Column(Integer, ForeignKey('country.id'), nullable=False)
    country = relationship('Country', backref='films')

    genres = relationship(
        'Genre',
        secondary=film_genre,
        back_populates='films'
    )

    actors = relationship(
        'Actor',
        secondary=film_actor,
        back_populates='films'
    )

    ratings = relationship('Ratings', back_populates='film')

    name = Column(String(50), nullable=False)
    description = Column(String(10000))
    duration = Column(Time, nullable=False)
    release_date = Column(Date, nullable=False)


class Translation(Base):
    __tablename__ = 'translation'

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False, unique=True)


class Copy(Base):
    __tablename__ = 'copy'

    id = Column(Integer, primary_key=True)
    film_id = Column(Integer, ForeignKey('film.id'), nullable=False)
    film = relationship('Film', back_populates='copies')

    office_id = Column(Integer, ForeignKey('office.id'), nullable=False)
    office = relationship('Office', back_populates='copies')

    translation_id = Column(Integer, ForeignKey('translation.id'),
                            nullable=False)
    price = Column(DOUBLE(precision=4, scale=2), nullable=False)
    stock = Column(Integer, nullable=False)
    __table_args__ = (
        UniqueConstraint(
            'film_id',
            'office_id',
            'tarnslation_id',
            name='unique_film_office_translation'
        ),
    )


class Package(Base):
    __tablename__ = 'package'

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)
    days = Column(Integer, nullable=False, unique=True)
    price = Column(DOUBLE(precision=4, scale=2), nullable=False)
