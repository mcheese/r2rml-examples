use ex_stud;

DROP TABLE IF EXISTS einschr;
DROP TABLE IF EXISTS imma;
DROP TABLE IF EXISTS semester;
DROP TABLE IF EXISTS modul;
DROP TABLE IF EXISTS fak;
DROP TABLE IF EXISTS student;

CREATE TABLE student (
  stud_id INTEGER NOT NULL,
  name varchar(10) NOT NULL,

  PRIMARY KEY (stud_id)
);

CREATE TABLE fak (
  fak_id INTEGER NOT NULL,
  name varchar(10) NOT NULL,

  PRIMARY KEY (fak_id)
);

CREATE TABLE modul (
  mod_id INTEGER NOT NULL,
  name varchar(10) NOT NULL,
  fak_id INTEGER NOT NULL,

  PRIMARY KEY (mod_id),
  FOREIGN KEY (fak_id) REFERENCES fak(fak_id)
);

CREATE TABLE semester (
  sem_id INTEGER NOT NULL,
  von date NOT NULL,
  bis date NOT NULL,

  PRIMARY KEY (sem_id)
);

CREATE TABLE imma (
  stud_id INTEGER NOT NULL,
  sem_id INTEGER NOT NULL,

  PRIMARY KEY (stud_id, sem_id),
  FOREIGN KEY (stud_id) REFERENCES student(stud_id),
  FOREIGN KEY (sem_id) REFERENCES semester(sem_id)
);

CREATE TABLE einschr (
  stud_id INTEGER NOT NULL,
  mod_id INTEGER NOT NULL,
  sem_id INTEGER NOT NULL,

  PRIMARY KEY (stud_id, mod_id, sem_id),
  FOREIGN KEY (stud_id) REFERENCES student(stud_id),
  FOREIGN KEY (mod_id) REFERENCES modul(mod_id),
  FOREIGN KEY (sem_id) REFERENCES semester(sem_id)
);



-- SAMPLE DATA --

INSERT INTO student VALUES
  (1000, 'Adams'),
  (1001, 'Baker'),
  (1002, 'Clark');

INSERT INTO fak VALUES
  (1, 'Mathematik'),
  (2, 'Wirtschaft');

INSERT INTO modul VALUES
  (10, 'Algebra', 1),
  (11, 'Analysis', 1),
  (12, 'BWL', 2);

INSERT INTO semester VALUES
  (100, '2014-10-01', '2015-04-01'),
  (101, '2015-04-01', '2015-10-01'),
  (102, '2015-10-01', '2016-04-01');

INSERT INTO imma VALUES
  (1000, 100),
  (1000, 101),
  (1001, 101),
  (1001, 102),
  (1002, 100),
  (1002, 102);

INSERT INTO einschr VALUES
  (1000, 10, 100),
  (1000, 11, 100),
  (1000, 12, 101),
  (1001, 10, 101),
  (1001, 11, 101),
  (1002, 12, 100),
  (1002, 12, 102);


