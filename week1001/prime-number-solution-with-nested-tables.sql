

BEGIN
  IF isPrime(13) THEN  dbms_output.put_line('13 is prime'); END IF;
  IF isPrime(169) THEN  dbms_output.put_line('169 is prime'); END IF;
  IF isPrime(59) THEN  dbms_output.put_line('59 is prime'); END IF;
  IF isPrime(2) THEN  dbms_output.put_line('12 is prime'); END IF;
END;
/

DECLARE
TYPE AA_PRIME_T is TABLE OF NUMBER;
aa_prime AA_PRIME_T := AA_PRIME_T();
count_samples NUMBER :=1;
prime_candidate NUMBER:=2;
BEGIN
    WHILE count_samples <=50 LOOP
        if(ISPRIME(prime_candidate)) THEN
            aa_prime.EXTEND;
            AA_prime(count_samples):=prime_candidate;
            count_samples:= count_samples + 1;
        end IF;
        prime_candidate:= prime_candidate + 1;
    END LOOP;
    FOR i IN 1 .. 50 LOOP
        dbms_output.put_line(i||'th prime: ' || AA_prime(i));
    END LOOP;
END;
