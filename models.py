from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, \
    Table
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
    office_head_id = Column(ForeignKey('employee.id'))
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
