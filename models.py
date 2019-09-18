from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

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


class Office(Base):
    __tablename__ = 'office'

    id = Column(Integer, primary_key=True)
    location_id = Column(Integer, ForeignKey('location.id'), nullable=False)
    location = relationship('Location', backref='offices')
    office_head_id = Column(ForeignKey('employee.id'))
    office_head = relationship('Employee', backref='subordinate_offices')
    name = Column(String(50), nullable=False, unique=True)


class Department(Base):
    __tablename__ = 'department'

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=True, unique=True)


class OfficeDepartment(Base):
    __tablename__ = 'office_department'

    office_id = Column(ForeignKey('office.id'), primary_key=True)
    office = relationship('Office', backref=)
