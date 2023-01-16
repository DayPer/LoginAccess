USE [CARVAJAL]
GO

/****** Object:  Trigger [dbo].[CalculoPedido]    Script Date: 15/01/2023 7:44:52 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[CalculoPedido]
ON [dbo].[Pedidos]
AFTER   INSERT,UPDATE

AS 
declare @PedUsu int
declare @pedPro int
declare @pedVrUnit numeric
declare @PedCant numeric
declare @PedID numeric


BEGIN
SELECT  
		@PedUsu=I.PedUsu,
		@pedPro=I.pedPro,
		@pedVrUnit=I.pedVrUnit,
		@PedCant=I.PedCant,
		@PedID=I.PedID
FROM   Inserted I;
	exec [sp.create_movement]@PedUsu,@pedPro,@pedVrUnit,@PedCant,@PedID
END
GO

ALTER TABLE [dbo].[Pedidos] ENABLE TRIGGER [CalculoPedido]
GO


