object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 519
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Img_Fontshow: TImage
    Left = 0
    Top = 0
    Width = 512
    Height = 512
  end
  object Label1: TLabel
    Left = 536
    Top = 14
    Width = 36
    Height = 13
    Caption = #23383#20307#65306
  end
  object Label2: TLabel
    Left = 536
    Top = 100
    Width = 48
    Height = 13
    Caption = #23383#31526#38598#65306
  end
  object Label3: TLabel
    Left = 536
    Top = 137
    Width = 36
    Height = 13
    Caption = #23383#24418#65306
  end
  object Label4: TLabel
    Left = 536
    Top = 179
    Width = 60
    Height = 13
    Caption = #23383#20307#36136#37327#65306
  end
  object Label5: TLabel
    Left = 536
    Top = 223
    Width = 60
    Height = 13
    Caption = #23383#20307#38388#36317#65306
  end
  object Label6: TLabel
    Left = 536
    Top = 57
    Width = 60
    Height = 13
    Caption = #23383#20307#22823#23567#65306
  end
  object Label7: TLabel
    Left = 536
    Top = 268
    Width = 60
    Height = 13
    Caption = #36755#20986#31934#24230#65306
  end
  object Label8: TLabel
    Left = 536
    Top = 313
    Width = 60
    Height = 13
    Caption = #21098#36753#31934#24230#65306
  end
  object CB_fname: TComboBox
    Left = 601
    Top = 11
    Width = 145
    Height = 21
    Hint = #23383#20307
    ItemHeight = 13
    TabOrder = 0
    OnChange = CB_fnameChange
  end
  object CB_fset: TComboBox
    Left = 602
    Top = 93
    Width = 145
    Height = 21
    Hint = #23383#31526#38598
    ItemHeight = 13
    TabOrder = 1
    OnChange = CB_fsetChange
    Items.Strings = (
      #40664#35748#23383#31526#38598
      'GB2312_'#20013#25991#23383#31526#38598
      #35199#27431#35821#35328#23383#31526#38598)
  end
  object CB_fstyle: TComboBox
    Left = 602
    Top = 134
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = CB_fstyleChange
    Items.Strings = (
      #24120#35268
      #31895#20307
      #26012#20307
      #31895#20307' '#26012#20307)
  end
  object CB_fqualtiy: TComboBox
    Left = 602
    Top = 176
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    OnChange = CB_fqualtiyChange
    Items.Strings = (
      #40664#35748#36136#37327
      #33609#31295#36136#37327
      #27491#31295#36136#37327
      #26080#25239#38191#40831#36136#37327
      #25239#38191#40831#36136#37327)
  end
  object btn_OK: TButton
    Left = 672
    Top = 446
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = btn_OKClick
  end
  object btn_Underline: TButton
    Left = 536
    Top = 369
    Width = 49
    Height = 30
    Caption = #19979#21010#32447
    TabOrder = 5
    OnClick = btn_UnderlineClick
  end
  object CB_fpitch: TComboBox
    Left = 602
    Top = 220
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    OnChange = CB_fpitchChange
    Items.Strings = (
      'Default'
      'Variable'
      'Fixed')
  end
  object btn_Save: TButton
    Left = 536
    Top = 446
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 7
    OnClick = btn_SaveClick
  end
  object CB_fsize: TComboBox
    Left = 602
    Top = 52
    Width = 145
    Height = 21
    Hint = #23383#20307
    ItemHeight = 13
    TabOrder = 8
    OnChange = CB_fsizeChange
    Items.Strings = (
      '8'
      '9'
      '10'
      '11'
      '12'
      '14'
      '16'
      '18'
      '20'
      '22'
      '24'
      '26'
      '28'
      '36'
      '48'
      '72')
  end
  object CB_OutPrecis: TComboBox
    Left = 602
    Top = 265
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    OnChange = CB_OutPrecisChange
    Items.Strings = (
      'OUT_DEFAULT_PRECIS'
      'OUT_STRING_PRECIS'
      'OUT_CHARACTER_PRECIS'
      'OUT_STROKE_PRECIS'
      'OUT_TT_PRECIS'
      'OUT_DEVICE_PRECIS'
      'OUT_RASTER_PRECIS'
      'OUT_TT_ONLY_PRECIS'
      'OUT_OUTLINE_PRECIS'
      'OUT_SCREEN_OUTLINE_PRECIS')
  end
  object CB_ClipPrecis: TComboBox
    Left = 602
    Top = 310
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    OnChange = CB_ClipPrecisChange
    Items.Strings = (
      'CLIP_DEFAULT_PRECIS'
      'CLIP_CHARACTER_PRECIS'
      'CLIP_STROKE_PRECIS')
  end
end
