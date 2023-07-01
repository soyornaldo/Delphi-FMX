object frmModulo: TfrmModulo
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 418
  Width = 949
  PixelsPerInch = 120
  object conCompras: TFDConnection
    Params.Strings = (
      'Database=C:\Trabajo\Fuentes\Android Projects\Comprar\compras.db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = conComprasBeforeConnect
    Left = 112
    Top = 72
  end
  object CompraTable: TFDQuery
    AfterDelete = CompraTableAfterDelete
    OnCalcFields = CompraTableCalcFields
    Connection = conCompras
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'SELECT * FROM compra')
    Left = 303
    Top = 87
    object CompraTableId: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CompraTableNombre: TStringField
      FieldName = 'Nombre'
      Origin = 'Nombre'
      Size = 50
    end
    object CompraTableCosto: TFloatField
      FieldName = 'Costo'
      Origin = 'Costo'
    end
    object CompraTableCantidad: TIntegerField
      FieldName = 'Cantidad'
      Origin = 'Cantidad'
    end
    object CompraTableImporteCosto: TFloatField
      FieldName = 'ImporteCosto'
      Origin = 'ImporteCosto'
    end
    object CompraTableVenta: TFloatField
      FieldName = 'Venta'
      Origin = 'Venta'
    end
    object CompraTableImporteVenta: TFloatField
      FieldName = 'ImporteVenta'
      Origin = 'ImporteVenta'
    end
    object CompraTableGanancia: TFloatField
      FieldName = 'Ganancia'
      Origin = 'Ganancia'
    end
    object CompraTableActivo: TBooleanField
      FieldName = 'Activo'
      Origin = 'Activo'
    end
    object CompraTableDetalle: TStringField
      FieldKind = fkCalculated
      FieldName = 'Detalle'
      Size = 50
      Calculated = True
    end
  end
  object CompraTotales: TFDQuery
    Connection = conCompras
    SQL.Strings = (
      'Select Sum(ImporteCosto) as ImporteCosto,'
      '       Sum(ImporteVenta) as ImporteVenta,'
      '       Sum(Ganancia) as Ganancia'
      'from   Compra')
    Left = 304
    Top = 216
    object CompraTotalesImporteCosto: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ImporteCosto'
      Origin = 'ImporteCosto'
      ProviderFlags = []
      ReadOnly = True
    end
    object CompraTotalesImporteVenta: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ImporteVenta'
      Origin = 'ImporteVenta'
      ProviderFlags = []
      ReadOnly = True
    end
    object CompraTotalesGanancia: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Ganancia'
      Origin = 'Ganancia'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object CompraTotalesActivo: TFDQuery
    Connection = conCompras
    SQL.Strings = (
      'Select Sum(ImporteCosto) as ImporteCosto,'
      '       Sum(ImporteVenta) as ImporteVenta,'
      '       Sum(Ganancia) as Ganancia'
      'from   Compra'
      'where  Activo = 1')
    Left = 480
    Top = 224
    object CompraTotalesActivoImporteCosto: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ImporteCosto'
      Origin = 'ImporteCosto'
      ProviderFlags = []
      ReadOnly = True
    end
    object CompraTotalesActivoImporteVenta: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ImporteVenta'
      Origin = 'ImporteVenta'
      ProviderFlags = []
      ReadOnly = True
    end
    object CompraTotalesActivoGanancia: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Ganancia'
      Origin = 'Ganancia'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
