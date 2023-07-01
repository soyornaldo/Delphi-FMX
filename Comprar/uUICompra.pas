unit uUICompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  Data.Bind.Controls, Fmx.Bind.Navigator, Data.DB,
  uCompraClass;

type
  TfrmUICompra = class(TForm)
    Layout1: TLayout;
    layTotales: TLayout;
    Rectangle1: TRectangle;
    reInput: TRectangle;
    layConfirmarDelete: TLayout;
    lnNombre: TLine;
    lblNombre: TLabel;
    edtNombre: TEdit;
    lnCantidad: TLine;
    lblCantidad: TLabel;
    edtCantidad: TEdit;
    lnlCosto: TLine;
    lblCosto: TLabel;
    edtCosto: TEdit;
    lnVenta: TLine;
    lblVenta: TLabel;
    edtVenta: TEdit;
    Circle1: TCircle;
    layInput: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Line1: TLine;
    Label1: TLabel;
    edtImporteCosto: TEdit;
    Line2: TLine;
    Label2: TLabel;
    edtImporteVenta: TEdit;
    Line3: TLine;
    Label3: TLabel;
    edtGanancia: TEdit;
    layNavigator: TLayout;
    Image2: TImage;
    imgFirst: TImage;
    imgPrior: TImage;
    Rectangle2: TRectangle;
    imgNext: TImage;
    imgLast: TImage;
    imgAdd: TImage;
    imgDelete: TImage;
    Circle2: TCircle;
    layNavLeft: TLayout;
    layNavCenter: TLayout;
    Layout2: TLayout;
    Label4: TLabel;
    recConfirmar: TRectangle;
    lblConfirmar: TLabel;
    procedure edtNombreKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtCantidadKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtCostoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtVentaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure edtCantidadKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtVentaKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtCostoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Image2Click(Sender: TObject);
    procedure recConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNombreKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    cantidad: integer;
    costo,venta: real;




    procedure ActualizaCompra;
    procedure CalculaTotales;
  public
    { Public declarations }
    compra: TCompra;
    agregando: boolean;
  end;

var
  frmUICompra: TfrmUICompra;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses uModulo, uMain;

procedure TfrmUICompra.edtNombreKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
     if Key = vkreturn then  edtCantidad.SetFocus;
end;





procedure TfrmUICompra.ActualizaCompra;
begin
       if edtCantidad.Text.Length > 0 then cantidad := edtCantidad.Text.ToInteger else cantidad := 0;
       if edtCosto.Text.Length > 0    then costo    := edtCosto.Text.ToDouble     else costo    := 0.00;
       if edtVenta.Text.Length > 0    then venta    := edtVenta.Text.ToDouble     else venta    := 0.00;

       compra.Nombre        := edtNombre.Text;
       compra.Cantidad      := cantidad;
       compra.Costo         := costo;
       compra.Venta         := venta;
end;


procedure TfrmUICompra.CalculaTotales;
begin
       edtImporteCosto.Text := FormatFloat('#,###,##0.00',compra.ImporteCosto);
       edtImporteVenta.Text := FormatFloat('#,###,##0.00',compra.ImporteVenta);
       edtGanancia.Text     := FormatFloat('#,###,##0.00',compra.Ganancia);
end;

procedure TfrmUICompra.edtCantidadKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin

     if Key = vkreturn then begin
         try
            if trim(edtCantidad.Text) = '' then
                 cantidad := 0
            else
                 cantidad := StrToInt(edtCantidad.Text);

            CalculaTotales;
         except
            ShowMessage('Error, la cantidad es un N�mero entero');
         end;

         edtCosto.SetFocus;
     end
     else
         if not (KeyChar in [#8,'0'..'9']) then
              KeyChar := #0;

end;



procedure TfrmUICompra.edtCantidadKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
      if edtCantidad.Text.Length > 0 then begin
          cantidad := StrToInt(edtCantidad.Text);
          ActualizaCompra;
      end;
end;


procedure TfrmUICompra.edtCostoKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
     if edtCosto.Text.Length > 0 then begin
         costo := StrToFloat(edtCosto.Text);
         ActualizaCompra;
     end;
end;


procedure TfrmUICompra.edtVentaKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
     if edtVenta.Text.Length > 0 then begin
         venta := StrToFloat(edtVenta.Text);
         ActualizaCompra;
     end;
end;


procedure TfrmUICompra.edtNombreKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
     if edtNombre.Text.Length > 0 then begin
         compra.Nombre := edtNombre.Text;
     end;
end;



procedure TfrmUICompra.edtCostoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
 compra: TCompra;
begin
     if Key = vkreturn then begin
         try
            if trim(edtCosto.Text) = '' then
                 costo := 0
            else
                 costo := StrToFloat(edtCosto.Text);

            compra.Cantidad      := cantidad;
            compra.Costo         := costo;
            compra.Venta         := venta;

            edtImporteCosto.Text := FormatFloat('#,###,##0.00',compra.ImporteCosto);
            edtGanancia.Text     := FormatFloat('#,###,##0.00',compra.Ganancia);
         except
            ShowMessage('Error, el Costo es un N�mero');
         end;

         edtVenta.SetFocus;
     end
     else
         if not (KeyChar in [#8,'.','0'..'9']) then
             KeyChar := #0;
end;




procedure TfrmUICompra.edtVentaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
 compra: TCompra;
begin
     if Key = vkreturn then begin
         try
            if trim(edtVenta.Text) = '' then
                 venta := 0
            else
                 venta := StrToFloat(edtVenta.Text);

            compra.Cantidad      := cantidad;
            compra.Costo         := costo;
            compra.Venta         := venta;

            edtImporteVenta.Text := FormatFloat('#,###,##0.00',compra.ImporteVenta);
            edtGanancia.Text     := FormatFloat('#,###,##0.00',compra.Ganancia);
         except
            ShowMessage('Error, la Venta es un N�mero');
         end;

         edtNombre.SetFocus;
     end
     else
         if not (KeyChar in [#8,'.','0'..'9']) then
             KeyChar := #0;

end;



procedure TfrmUICompra.FormActivate(Sender: TObject);
begin
     cantidad := compra.Cantidad;
     costo    := compra.Costo;
     venta    := compra.Venta;

     edtNombre.Text       := compra.Nombre;
     edtCantidad.Text     := IntToStr(compra.Cantidad);
     edtCosto.Text        := FloatToStr(compra.Costo);
     edtVenta.Text        := FloatToStr(compra.Venta);

     edtImporteCosto.text := FloatToStr(compra.ImporteCosto);
     edtImporteVenta.text := FloatToStr(compra.ImporteVenta);
     edtGanancia.text     := FloatToStr(compra.Ganancia);
end;

procedure TfrmUICompra.FormCreate(Sender: TObject);
begin
     agregando := True;
{     cantidad := 0;
     costo    := 0.00;
     venta    := 0.00;

     //edtCantidad.Text := '0';
     //edtCosto.Text    := '0.00';
     //edtVenta.Text    := '0.00';

     edtImporteCosto.text := '0.00';
     edtImporteVenta.text := '0.00';
     edtGanancia.text     := '0.00';}
end;

procedure TfrmUICompra.Image1Click(Sender: TObject);
var
 compra: TCompra;
 mensaje: string;
begin
      compra.Cantidad      := cantidad;
      compra.Costo         := costo;
      compra.Venta         := venta;

      edtImporteCosto.Text := FormatFloat('#,###,##0.00',compra.ImporteCosto);
      edtImporteVenta.Text := FormatFloat('#,###,##0.00',compra.ImporteVenta);
      edtGanancia.Text     := FormatFloat('#,###,##0.00',compra.Ganancia);
end;

procedure TfrmUICompra.Image2Click(Sender: TObject);
begin
     with frmModulo do begin
        if agregando then begin
           ActualizaCompra;
           CompraTable.append;
           CompraTable.FieldValues['Nombre']   := compra.Nombre;
           CompraTable.FieldValues['Cantidad'] := compra.Cantidad;
           CompraTable.FieldValues['Costo']    := compra.Costo;
           CompraTable.FieldValues['Venta']    := compra.Venta;
           CompraTable.FieldValues['Activo']   := True;
           CompraTable.Post;
        end;

     end;
     Self.Close;
end;

procedure TfrmUICompra.recConfirmarClick(Sender: TObject);
begin
      recConfirmar.Visible := False;
end;

end.
