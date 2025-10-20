create or replace PACKAGE add_to_examples_pkg as
    PROCEDURE add_to_examples(name IN VARCHAR2);
    PROCEDURE add_to_examples(name IN VARCHAR2, score IN NUMBER);
    PROCEDURE add_to_examples(name IN VARCHAR2, score IN NUMBER, status IN VARCHAR2);

END add_to_examples_pkg;
/

CREATE OR REPLACE PACKAGE BODY add_to_examples_pkg AS

    PROCEDURE add_to_examples(name IN VARCHAR2) IS
    BEGIN
        INSERT INTO texample (name)
        VALUES (name);
    END add_to_examples;

    PROCEDURE add_to_examples(name IN VARCHAR2, score IN NUMBER) IS
    BEGIN
        INSERT INTO texample (name, score)
        VALUES (name, score);
    END add_to_examples;

    PROCEDURE add_to_examples(name IN VARCHAR2, score IN NUMBER, status IN VARCHAR2) IS
    BEGIN
        INSERT INTO texample (name, score, status)
        VALUES (name, score, status);
    END add_to_examples;

END add_to_examples_pkg;
/

