-- Fires only when the SCORE column is updated.
-- For each changed row, if the score changed, set STATUS based on the new score.
CREATE OR REPLACE TRIGGER trg_tExample_status_from_score
BEFORE UPDATE OF score ON tExample
FOR EACH ROW
WHEN (NEW.score <> OLD.score)   -- only act if the score actually changed
BEGIN
  :NEW.status := CASE
                   WHEN :NEW.score >= 70 THEN 'PASS'
                   ELSE 'FAIL'
                 END;
END;
/