ALTER SEQUENCE casesvc.casegroupseq RESTART WITH 1;
ALTER SEQUENCE casesvc.caseeventseq RESTART WITH 1;
ALTER SEQUENCE casesvc.caseseq RESTART WITH 1;


-- Case group
INSERT INTO casesvc.casegroup(casegrouppk, id, partyid, collectionexerciseid, sampleunitref, sampleunittype) VALUES (nextval('casesvc.casegroupseq'), '9a5f2be5-f944-41f9-982c-3517cfcfef3c', '3b136c4b-7a14-4904-9e01-13364dd7b972', '14fb3e68-4dca-46db-bf49-04b84e07e77c', '49900000000', 'B');

-- Reporting unit ('B') case
INSERT INTO casesvc.case(casepk, id, casegroupfk, casegroupid, partyid, sampleunittype, collectioninstrumentid, statefk, actionplanid, createddatetime, createdby, iac) VALUES (nextval('casesvc.caseseq'), '7bc5d41b-0549-40b3-ba76-42f6d4cf3fdb', 1, '9a5f2be5-f944-41f9-982c-3517cfcfef3c', '3b136c4b-7a14-4904-9e01-13364dd7b972', 'B', '40c7c047-4fb3-4abe-926e-bf19fa2c0a1e', 'ACTIONABLE', 'e71002ac-3575-47eb-b87f-cd9db92bf9a7', current_timestamp, 'SYSTEM', '4kyznty4fw3s');
