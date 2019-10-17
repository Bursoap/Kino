from decimal import Decimal

import sqlalchemy as sa
from sqlalchemy.dialects.mysql import DOUBLE
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, backref

engine = sa.create_engine(
    'mysql://kino:kino@172.17.0.2/movie_rental', echo=True)
Base = declarative_base()


class Country(Base):
    __tablename__ = 'country'

    id = sa.Column(sa.Integer, primary_key=True)
    name = sa.Column(sa.String(50), nullable=False)


class Location(Base):
    __tablename__ = 'location'

    id = sa.Column(sa.Integer, primary_key=True)
    country_id = sa.Column(sa.Integer, sa.ForeignKey('country.id'), nullable=False)
    country = relationship('Country', backref='locations')

    state = sa.Column(sa.String(100))
    city = sa.Column(sa.String(100))
    street = sa.Column(sa.String(100))
    number = sa.Column(sa.String(100))


office_department = sa.Table(
    'office_department',
    Base.metadata,
    sa.Column('office_id', sa.Integer, sa.ForeignKey('office.id')),
    sa.Column('department_id', sa.Integer, sa.ForeignKey('department.id'))
)


class Office(Base):
    __tablename__ = 'office'

    id = sa.Column(sa.Integer, primary_key=True)
    location_id = sa.Column(sa.Integer, sa.ForeignKey('location.id'), nullable=False)
    location = relationship('Location', backref='offices')

    office_head_id = sa.Column(sa.Integer, sa.ForeignKey('employee.id', use_alter=True))
    office_head = relationship('Employee', backref='subordinate_offices')

    name = sa.Column(sa.String(50), nullable=False, unique=True)
    departments = relationship(
        'Department',
        secondary=office_department,
        back_populates='offices'
    )


class Department(Base):
    __tablename__ = 'department'

    id = sa.Column(sa.Integer, primary_key=True)
    name = sa.Column(sa.String(50), nullable=True, unique=True)
    offices = relationship(
        'Office',
        secondary=office_department,
        back_populates='departments'
    )


class Person(Base):
    __tablename__ = 'person'

    id = sa.Column(sa.Integer, primary_key=True)
    location_id = sa.Column(sa.Integer, sa.ForeignKey('location.id'))
    location = relationship('Location', backref='persons')

    first_name = sa.Column(sa.String(50), nullable=False)
    last_name = sa.Column(sa.String(50), nullable=False)
    birth_date = sa.Column(sa.Date, nullable=False)
    death_date = sa.Column(sa.Date)


class Employee(Base):
    __tablename__ = 'employee'

    id = sa.Column(sa.Integer, primary_key=True)
    person_id = sa.Column(sa.Integer, sa.ForeignKey('person.id'),
                       nullable=False, unique=True)
    person = relationship('Person', backref=backref('employee', uselist=False))

    office_id = sa.Column(sa.Integer, sa.ForeignKey('office.id'), nullable=False)
    office = relationship('Office', backref='employees')

    dept_id = sa.Column(sa.Integer, sa.ForeignKey('department.id'), nullable=False)
    department = relationship('Department', backref='employees')

    title = sa.Column(sa.String(100), nullable=False)
    salary = sa.Column(DOUBLE(precision=8, scale=2), nullable=False)
    active = sa.Column(sa.Boolean, nullable=False, default=True)
    employment_date = sa.Column(sa.Date, nullable=False)
    dismiss_date = sa.Column(sa.Date)


film_genre = sa.Table(
    'film_genre',
    Base.metadata,
    sa.Column('film_id', sa.Integer, sa.ForeignKey('film.id')),
    sa.Column('genre_id', sa.Integer, sa.ForeignKey('genre.id'))
)


class Genre(Base):
    __tablename__ = 'genre'

    id = sa.Column(sa.Integer, primary_key=True)
    films = relationship(
        'Film',
        secondary=film_genre,
        back_populates='genres'
    )

    name = sa.Column(sa.String(50), nullable=False, unique=True)


film_actor = sa.Table(
    'film_actor',
    Base.metadata,
    sa.Column('film_id', sa.Integer, sa.ForeignKey('film.id')),
    sa.Column('actor_id', sa.Integer, sa.ForeignKey('actor.id'))
)


class Actor(Base):
    __tablename__ = 'actor'

    id = sa.Column(sa.Integer, primary_key=True)
    person_id = sa.Column(sa.Integer, sa.ForeignKey('person.id'),
                       nullable=False, unique=True)
    person = relationship('Person', backref=backref('actor', uselist=False))

    films = relationship(
        'Film',
        secondary=film_actor,
        back_populates='actors'
    )

    biography = sa.Column(sa.String(10000))
    oscar = sa.Column(sa.Boolean, nullable=False, default=True)


class Film(Base):
    __tablename__ = 'film'

    id = sa.Column(sa.Integer, primary_key=True)
    producer_id = sa.Column(sa.Integer, sa.ForeignKey('person.id'), nullable=False)
    producer = relationship('Person', backref='produced_films')

    country_id = sa.Column(sa.Integer, sa.ForeignKey('country.id'), nullable=False)
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

    name = sa.Column(sa.String(50), nullable=False)
    description = sa.Column(sa.String(10000))
    duration = sa.Column(sa.Time, nullable=False)
    release_date = sa.Column(sa.Date, nullable=False)


class Rating(Base):
    __tablename__ = 'rating'

    id = sa.Column(sa.Integer, primary_key=True)

    film_id = sa.Column(sa.Integer, sa.ForeignKey('film.id'), nullable=False)
    film = relationship('Film', backref='ratings')

    client_id = sa.Column(sa.Integer, sa.ForeignKey('client.id'), nullable=False)
    client = relationship('Client', backref='films_ratings')

    rating = sa.Column(DOUBLE(precision=2, scale=1), nullable=False)


class Translation(Base):
    __tablename__ = 'translation'

    id = sa.Column(sa.Integer, primary_key=True)
    name = sa.Column(sa.String(50), nullable=False, unique=True)


class Package(Base):
    __tablename__ = 'package'

    id = sa.Column(sa.Integer, primary_key=True)
    name = sa.Column(sa.String(50), nullable=False)
    days = sa.Column(sa.Integer, nullable=False, unique=True)
    price = sa.Column(DOUBLE(precision=4, scale=2), nullable=False)


class Client(Base):
    __tablename__ = 'client'

    id = sa.Column(sa.Integer, primary_key=True)
    person_id = sa.Column(sa.Integer, sa.ForeignKey('person.id'),
                       nullable=False, unique=True)
    person = relationship('Person', backref=backref('client', uselist=False))

    created = sa.Column(sa.TIMESTAMP, nullable=False, server_default=sa.func.now())
    email = sa.Column(sa.String(100))
    active = sa.Column(sa.Boolean, nullable=False, default=True)


deal_copy = sa.Table(
    'deal_copy',
    Base.metadata,
    sa.Column('deal_id', sa.Integer, sa.ForeignKey('deal.id')),
    sa.Column('copy_id', sa.Integer, sa.ForeignKey('copy.id'))
)


class Copy(Base):
    __tablename__ = 'copy'

    id = sa.Column(sa.Integer, primary_key=True)
    film_id = sa.Column(sa.Integer, sa.ForeignKey('film.id'), nullable=False)
    film = relationship('Film', backref='copies')

    office_id = sa.Column(sa.Integer, sa.ForeignKey('office.id'), nullable=False)
    office = relationship('Office', backref='copies')

    translation_id = sa.Column(sa.Integer, sa.ForeignKey('translation.id'),
                            nullable=False)
    translation = relationship('Translation', backref='copies')

    deals = relationship(
        'Deal',
        secondary=deal_copy,
        back_populates='copies'
    )

    price = sa.Column(DOUBLE(precision=4, scale=2), nullable=False)
    stock = sa.Column(sa.Integer, nullable=False)
    __table_args__ = (
        sa.UniqueConstraint(
            'film_id',
            'office_id',
            'translation_id',
            name='unique_film_office_translation'
        ),
    )


class Deal(Base):
    __tablename__ = 'deal'

    id = sa.Column(sa.Integer, primary_key=True)
    client_id = sa.Column(sa.Integer, sa.ForeignKey('client.id'), nullable=False)
    client = relationship('Client', backref='deals')

    office_id = sa.Column(sa.Integer, sa.ForeignKey('office.id'), nullable=False)
    office = relationship('Office', backref='deals')

    employee_id = sa.Column(sa.Integer, sa.ForeignKey('employee.id'), nullable=False)
    employee = relationship('Employee', backref='deals')

    package_id = sa.Column(sa.Integer, sa.ForeignKey('package.id'),
                        nullable=False, default=1)
    package = relationship('Package', backref='deals')

    copies = relationship(
        'Copy',
        secondary=deal_copy,
        back_populates='deals'
    )

    total_earnings = sa.Column(DOUBLE(precision=8, scale=2), default=Decimal(0.0))
    start_date = sa.Column(sa.Date, nullable=False)
    valid_until_date = sa.Column(sa.Date, nullable=False)
    end_date = sa.Column(sa.Date)


before_create_deal = sa.DDL(
    """
    CREATE TRIGGER before_create_deal BEFORE INSERT ON deal
        FOR EACH ROW BEGIN
    
            DECLARE tmp_package_days INT DEFAULT 0;
    
            SELECT days
            FROM package
            WHERE id = NEW.package_id
            INTO tmp_package_days;
    
            SET NEW.start_date = IF(NEW.start_date, NEW.start_date, CURRENT_DATE());
            SET NEW.valid_until_date = DATE_ADD(NEW.start_date, INTERVAL tmp_package_days DAY);
        END;
    """
)

after_create_deal_copy = sa.DDL(
    """
    CREATE TRIGGER after_create_deal_copy AFTER INSERT ON deal_copy
        FOR EACH ROW BEGIN
    
            DECLARE tmp_price DOUBLE(4, 2) DEFAULT 0.0;
            DECLARE tmp_package_id INT UNSIGNED DEFAULT 1;
            DECLARE tmp_package_price DOUBLE(4, 2) DEFAULT 0.0;
    
            SELECT price
            FROM copy
            WHERE id = NEW.copy_id
            INTO tmp_price;
    
            SELECT package_id
            FROM deal
            WHERE id = NEW.deal_id
            INTO tmp_package_id;
    
            SELECT price
            FROM package
            WHERE id = tmp_package_id
            INTO tmp_package_price;
    
            UPDATE deal
            SET total_earnings = total_earnings + tmp_price + tmp_package_price
            WHERE id = NEW.deal_id;
        END;
    """
)

sa.event.listen(Deal.__table__, 'after_create', before_create_deal)
sa.event.listen(deal_copy, 'after_create', after_create_deal_copy)

Base.metadata.create_all(engine)
