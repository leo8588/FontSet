unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Forms, Dialogs, StdCtrls, TeCanvas,
  ExtCtrls, TeePenDlg, IniFiles, Controls;
type

  TMainForm = class(TForm)
    Img_Fontshow: TImage;
    CB_fname: TComboBox;
    CB_fset: TComboBox;
    CB_fstyle: TComboBox;
    CB_fqualtiy: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_OK: TButton;
    btn_Underline: TButton;
    Label4: TLabel;
    CB_fpitch: TComboBox;
    Label5: TLabel;
    btn_Save: TButton;
    Label6: TLabel;
    CB_fsize: TComboBox;
    CB_OutPrecis: TComboBox;
    Label7: TLabel;
    CB_ClipPrecis: TComboBox;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CB_fnameChange(Sender: TObject);
    procedure CB_fsetChange(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure CB_fqualtiyChange(Sender: TObject);
    procedure CB_fstyleChange(Sender: TObject);
    procedure btn_UnderlineClick(Sender: TObject);
    procedure CB_fpitchChange(Sender: TObject);
    procedure CB_fsizeChange(Sender: TObject);
    procedure CB_OutPrecisChange(Sender: TObject);
    procedure CB_ClipPrecisChange(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
    bUnderline:Boolean;
    fLogFont:TLogFont;
    procedure InitForm();
    procedure InitCtrls();
    procedure ShowFont();
    procedure ClearCanvas();
    procedure Initfont();
    procedure SaveFontIni();
    procedure SetIniFile(Strtitle, StrName :String; Value: String);


  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure TMainForm.Initfont;
begin
  fLogFont.lfWidth         :=0;
  fLogFont.lfEscapement    :=0;
  fLogFont.lfOrientation   :=0;
  fLogFont.lfWeight        :=FW_BOLD;
  fLogFont.lfItalic        :=0;
  fLogFont.lfUnderline     :=0;
  fLogFont.lfStrikeOut     :=0;
  fLogFont.lfCharSet       :=DEFAULT_CHARSET;
  fLogFont.lfOutPrecision  :=OUT_STRING_PRECIS;
  fLogFont.lfClipPrecision :=CLIP_DEFAULT_PRECIS;
  fLogFont.lfQuality       :=DEFAULT_QUALITY;
  fLogFont.lfPitchAndFamily:=FF_SWISS;
  fLogFont.lfFaceName      :='Arial';
end;

procedure  TMainForm.InitForm;
begin
  ClearCanvas;
  Initfont;
  InitCtrls();
  bUnderline:=False;
  SaveFontIni;
end;

procedure TMainForm.btn_OKClick(Sender: TObject);
begin
  //将对应的值存入结构中

  Close;
end;

procedure TMainForm.btn_SaveClick(Sender: TObject);
begin
   Img_Fontshow.Picture.Bitmap.SaveToFile('字体预览.bmp');
end;

procedure TMainForm.btn_UnderlineClick(Sender: TObject);
begin
  if bUnderline then
  begin
    bUnderline:=False;
    btn_Underline.Font.Style:=[fsUnderline];
    fLogFont.lfUnderline:=0;
    SetIniFile('Font','lfUnderline','0');
  end
  else
  begin
    bUnderline:=True;
    btn_Underline.Font.Style:=[];
    fLogFont.lfUnderline:=1;
    SetIniFile('Font','lfUnderline','1');
  end;
  ShowFont;
end;

procedure TMainForm.CB_ClipPrecisChange(Sender: TObject);
begin
    case CB_ClipPrecis.ItemIndex of
      0:
      begin
        fLogFont.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
        SetIniFile('Font','lfClipPrecision','CLIP_DEFAULT_PRECIS');
      end;
      1:
      begin
        fLogFont.lfClipPrecision:=CLIP_CHARACTER_PRECIS;
        SetIniFile('Font','lfClipPrecision','CLIP_CHARACTER_PRECIS');
      end;
      2:
      begin
        fLogFont.lfClipPrecision:=CLIP_STROKE_PRECIS;
        SetIniFile('Font','lfClipPrecision','CLIP_STROKE_PRECIS');
      end;
    end;
    ShowFont;
end;

procedure TMainForm.CB_fnameChange(Sender: TObject);
begin
  ZeroMemory(@fLogFont.lfFaceName[0],SizeOf(fLogFont.lfFaceName));
  CopyMemory(@fLogFont.lfFaceName[0],PChar(CB_fname.Text),Length(CB_fname.Text)*sizeof(Char));
  SetIniFile('Font','lfFaceName',CB_fname.Text);
  ShowFont;
end;

procedure TMainForm.CB_fpitchChange(Sender: TObject);
begin
    case CB_fpitch.ItemIndex of
      0:
      begin
        fLogFont.lfPitchAndFamily:=DEFAULT_PITCH or FF_SWISS;
        SetIniFile('Font','lfPitchAndFamily','DEFAULT_PITCH or FF_SWISS');
      end;
      1:
      begin
        fLogFont.lfQuality:=FIXED_PITCH or FF_SWISS;
        SetIniFile('Font','lfPitchAndFamily','FIXED_PITCH or FF_SWISS');
      end;
      2:
      begin
        fLogFont.lfQuality:=VARIABLE_PITCH or FF_SWISS;
        SetIniFile('Font','lfPitchAndFamily','VARIABLE_PITCH or FF_SWISS');
      end;
    end;
    ShowFont;
end;

procedure TMainForm.CB_fqualtiyChange(Sender: TObject);
begin
  case CB_fqualtiy.ItemIndex of
    0:
    begin
      fLogFont.lfQuality:=DEFAULT_QUALITY;
      SetIniFile('Font','lfQuality','DEFAULT_QUALITY');
    end;
    1:
    begin
      fLogFont.lfQuality:=DRAFT_QUALITY;
      SetIniFile('Font','lfQuality','DRAFT_QUALITY');
    end;
    2:
    begin
      fLogFont.lfQuality:=PROOF_QUALITY;
      SetIniFile('Font','lfQuality','PROOF_QUALITY');
    end;
    3:
    begin
      fLogFont.lfQuality:=NONANTIALIASED_QUALITY;
      SetIniFile('Font','lfQuality','NONANTIALIASED_QUALITY');
    end;
    4:
    begin
      fLogFont.lfQuality:=ANTIALIASED_QUALITY;
      SetIniFile('Font','lfQuality','ANTIALIASED_QUALITY');
    end;
  end;
  ShowFont;
end;

procedure TMainForm.CB_fsetChange(Sender: TObject);
begin
  case CB_fset.ItemIndex of
    0:
    begin
      fLogFont.lfCharSet:=DEFAULT_CHARSET;
      SetIniFile('Font','lfCharSet','DEFAULT_CHARSET');
    end;
    1:
    begin
      fLogFont.lfCharSet:=GB2312_CHARSET;
      SetIniFile('Font','lfCharSet','GB2312_CHARSET');
    end;
    2:
    begin
      fLogFont.lfCharSet:=EASTEUROPE_CHARSET;
      SetIniFile('Font','lfCharSet','EASTEUROPE_CHARSET');
    end;
  end;
  ShowFont;
end;

procedure TMainForm.CB_fsizeChange(Sender: TObject);
begin
  fLogFont.lfHeight:= StrToInt(CB_fsize.Text);
  SetIniFile('Font','lfHeight',CB_fsize.Text);
  ShowFont;
end;

procedure TMainForm.CB_fstyleChange(Sender: TObject);
begin
  case CB_fstyle.ItemIndex of
    0:
    begin
      fLogFont.lfWeight:= FW_NORMAL;
      fLogFont.lfItalic:=0;
      SetIniFile('Font','lfWeight','FW_NORMAL');
      SetIniFile('Font','lfItalic','0');
    end;
    1:
    begin
      fLogFont.lfWeight:= FW_BOLD;
      fLogFont.lfItalic:=0;
      SetIniFile('Font','lfWeight','FW_BOLD');
      SetIniFile('Font','lfItalic','0');
    end;
    2:
    begin
      fLogFont.lfWeight:= FW_NORMAL;
      fLogFont.lfItalic:=1;
      SetIniFile('Font','lfWeight','FW_NORMAL');
      SetIniFile('Font','lfItalic','1');
    end;
    3:
    begin
      fLogFont.lfWeight:= FW_BOLD;
      fLogFont.lfItalic:=1;
      SetIniFile('Font','lfWeight','FW_BOLD');
      SetIniFile('Font','lfItalic','1');
    end;
  end;
  ShowFont;
end;

procedure TMainForm.CB_OutPrecisChange(Sender: TObject);
begin
  case CB_OutPrecis.ItemIndex of
    0:
    begin
      fLogFont.lfOutPrecision:= OUT_DEFAULT_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_DEFAULT_PRECIS');
    end;
    1:
    begin
      fLogFont.lfOutPrecision:= OUT_STRING_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_STRING_PRECIS');
    end;
    2:
    begin
      fLogFont.lfOutPrecision:= OUT_CHARACTER_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_CHARACTER_PRECIS');
    end;
    3:
    begin
      fLogFont.lfOutPrecision:= OUT_STROKE_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_STROKE_PRECIS');
    end;
    4:
    begin
      fLogFont.lfOutPrecision:= OUT_TT_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_TT_PRECIS');
    end;
    5:
    begin
      fLogFont.lfOutPrecision:= OUT_DEVICE_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_DEVICE_PRECIS');
    end;
    6:
    begin
      fLogFont.lfOutPrecision:= OUT_RASTER_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_RASTER_PRECIS');
    end;
    7:
    begin
      fLogFont.lfOutPrecision:= OUT_TT_ONLY_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_TT_ONLY_PRECIS');
    end;
    8:
    begin
      fLogFont.lfOutPrecision:= OUT_OUTLINE_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_OUTLINE_PRECIS');
    end;
    9:
    begin
      fLogFont.lfOutPrecision:= OUT_SCREEN_OUTLINE_PRECIS;
      SetIniFile('Font','lfOutPrecision','OUT_SCREEN_OUTLINE_PRECIS');
    end;      
  end;
  ShowFont;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  InitForm;
end;

procedure TMainForm.InitCtrls;
begin
  CB_fname.Items := Screen.Fonts;
  CB_fname.SelText:=fLogFont.lfFaceName;
  CB_fset.SelText:=CB_fset.Items[0];
  CB_fstyle.SelText:=CB_fstyle.Items[1];
  CB_fqualtiy.SelText:=CB_fqualtiy.Items[0];
  CB_fpitch.SelText:=CB_fpitch.Items[0];
  CB_fsize.SelText:=CB_fsize.Items[8];
  CB_ClipPrecis.SelText:=CB_ClipPrecis.Items[0];
  CB_OutPrecis.SelText:=CB_OutPrecis.Items[1];

end;
procedure TMainForm.ClearCanvas();
begin
  Img_Fontshow.Canvas.Brush.Color:=clBlack;
  Img_Fontshow.Canvas.FillRect(Img_Fontshow.ClientRect);
end;

procedure TMainForm.ShowFont();
begin
  ClearCanvas;
  with Img_Fontshow do
  begin
    Canvas.Font.Color:=clGray;
    Canvas.Brush.Style:=bsClear;

    Canvas.Font.Handle := CreateFontIndirect(fLogFont);
    Canvas.TextOut(10, 10, 'zhangsan/ZHANGSAN');
    if fLogFont.lfHeight <> 0 then
    begin
      Canvas.TextOut(10, 10+flogfont.lfHeight, '123456789');
      Canvas.TextOut(10, 10+flogfont.lfHeight*2, '鑫高益医院');
      Canvas.TextOut(Trunc(256-fLogFont.lfHeight*2),
                     Trunc(256+fLogFont.lfHeight/2), '字体预览');
    end
    else
    begin
      Canvas.TextOut(10, 30, '123456789');
      Canvas.TextOut(10, 50, '鑫高益医院');
      Canvas.TextOut(180, 190, '字体预览');
    end;


  end;

end;

procedure TMainForm.SetIniFile(Strtitle, StrName :String; Value: String);
var
  iniFile : TIniFile;
begin
  iniFile := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\Config.ini');
  //showmessage(ExtractFileDir(Application.ExeName));
  iniFile.WriteString(Strtitle,StrName,Value);
  IniFile.Free;
end;

procedure TMainForm.SaveFontIni();
begin
  SetIniFile('Font','lfFaceName','Arial');
  SetIniFile('Font','lfHeight','20');
  SetIniFile('Font','lfCharSet','DEFAULT_CHARSET');
  SetIniFile('Font','lfQuality','DEFAULT_QUALITY');
  SetIniFile('Font','lfWeight','FW_NORMAL');
  SetIniFile('Font','lfItalic','0');
  SetIniFile('Font','lfPitchAndFamily','DEFAULT_PITCH or FF_SWISS');
  SetIniFile('Font','lfUnderline','0');
  SetIniFile('Font','lfOutPrecision','OUT_STRING_PRECIS');
  SetIniFile('Font','lfClipPrecision','CLIP_DEFAULT_PRECIS');
end;

end.
