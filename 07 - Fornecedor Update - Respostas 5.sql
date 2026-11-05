DROP TABLE IF EXISTS Estoque;
DROP TABLE IF EXISTS Filial;

CREATE TABLE Filial (
    cnpj      VARCHAR(14) NOT NULL,
    nome      VARCHAR(200) NOT NULL,
    telefone  VARCHAR(15),
    endereco  VARCHAR(200),
    PRIMARY KEY (cnpj)
);

CREATE TABLE Estoque (
    id_produto   INT NOT NULL,
    cnpj_filial  VARCHAR(14) NOT NULL,
    preco        DECIMAL(10,2) NOT NULL,
    quantidade   INT NOT NULL,
    validade     DATE,
    PRIMARY KEY (id_produto, cnpj_filial)
);

INSERT INTO Filial (cnpj, nome, telefone, endereco) VALUES
('10101010000110', 'Filial Centro',    '3140001010', 'Rua Tupis, 50 - Belo Horizonte/MG'),
('20202020000120', 'Filial Savassi',   '3140002020', 'Rua Pernambuco, 400 - Belo Horizonte/MG');

INSERT INTO Estoque (id_produto, cnpj_filial, preco, quantidade, validade) VALUES
(1, '10101010000110', 22.90,  50, '2027-01-15'),
(1, '20202020000120', 23.50,  30, '2027-01-15'),
(2, '10101010000110',  8.90, 100, '2026-11-01'),
(4, '10101010000110', 12.50,  40, '2026-12-20'),
(5, '20202020000120',  9.90,  25, '2026-10-05');


UPDATE Estoque
SET preco = preco * 0.70
WHERE id_produto = 5
AND cnpj_filial = '20202020000120';

UPDATE Estoque
SET quantidade = 0
WHERE validade < '2026-11-01';

UPDATE Estoque
SET quantidade = quantidade + 10
WHERE id_produto = 1;

UPDATE Estoque
SET preco = preco * 1.05
WHERE cnpj_filial IN (
SELECT cnpj
FROM Filial
WHERE nome = 'Filial Centro'
);


SELECT * FROM Estoque;