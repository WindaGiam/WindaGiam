CREATE PROCEDURE InvertValue 
	@Id INT, @Column CHAR(1)
AS

CREATE TABLE #TEST2 ([Id] INT, [A] BIT, [B] BIT, [C] BIT, [D] BIT, [E] BIT)
INSERT INTO #TEST2 ([Id], [A], [C], [E]) VALUES (1, 'true', 'false', 'true')
INSERT INTO #TEST2 ([Id], [A], [B], [C]) VALUES (2, 'true', 'true', 'true')
INSERT INTO #TEST2 ([Id], [C], [D], [E]) VALUES (3, 'false', 'false', 'true')


declare @Sql varchar(max) = 'UPDATE #TEST2 SET ' + @Column + ' =  (case when (SELECT ' + @Column + ' FROM #TEST2 WHERE Id = ' + cast(@Id as varchar) + ') is null then null else ~(SELECT ' + @Column + ' FROM #TEST2 WHERE Id = ' + cast(@Id as varchar) + ') end) WHERE Id = ' + cast(@Id as varchar);
exec (@Sql)

select * from #TEST2
GO;