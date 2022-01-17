-- instruções:
-- Requerido apenas flask e mysql de imports
-- Database: `crud`
-- Abaixo Scripts para criação do banco de dados MYsql
-- Criação tabela `turma`
--
SET GLOBAL sql_mode=''

CREATE TABLE `turma` (
  `id` int(11) NOT NULL,
  `qt_alunos` int(11) NOT NULL,
  `professor` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


ALTER TABLE `turma`
  ADD PRIMARY KEY (`id`);

INSERT INTO `turma` (`id`, `qt_alunos`, `professor`) VALUES
(10, 20, 'Saitama'),
(20, 40, 'Kaido'),
(30, 15, 'Maria');


--
-- estrutura tabela `estudantes`
--

CREATE TABLE `estudantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `turma_id` int(11),
  CONSTRAINT fk_turma foreign key (turma_id) references estudantes(id)
  
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

ALTER TABLE `estudantes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `estudantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


iNSERT INTO `estudantes` (`id`, `nome`, `email`, `telefone`,`turma_id`) VALUES
(3, 'Joao', 'jo@gmail.com', '009378976767',10),
(4, 'Jean', 'je@gmail.com', '999999999',10),
(5, 'Cirilo', 'ci@gmail.com', '7333392',20),
(6, 'Goku', 'go@gmail.com', '3434343',20),
(7, 'Naruto', 'na@gmail.com', '343434',20),
(8, 'Batman', 'ba@gmail.com', '7347374347',20),
(12, 'Cebolinha', 'ce@gmail.com', '11111111111',30),
(13, 'Marcelo', 'ma@gmail.com', '347374837483',30),
(14, 'Adolfo', 'ad@gmail.com', '4354354345',10);




