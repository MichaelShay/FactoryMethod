unit FactoryMethodUnit;


interface

uses   Windows, Messages, SysUtils, Variants, Classes;

type

  IWidget = interface
     procedure printName();
  end;


  TMyButton = Class(TInterfacedObject, IWidget)
    public
      procedure printName();
      destructor destroy;
  end;

  TMyLabel = Class(TInterfacedObject, IWidget)
    public
      procedure printName();
  end;

  TMyImage = Class(TInterfacedObject, IWidget)
    public
      procedure printName();
  end;

  IWidgetFactory = interface
     function CreateWidget(widgetType:string): IWidget;
  end;


  TMyButtonFactory = class(TInterfacedObject, IWidgetFactory)
      function CreateWidget(widgetType:string): IWidget;
  end;

  TMyLabelFactory = class(TInterfacedObject, IWidgetFactory)
      function CreateWidget(widgetType:string): IWidget;
  end;

  TMyImageFactory = class(TInterfacedObject, IWidgetFactory)
      function CreateWidget(widgetType:string): IWidget;
  end;


TAbstractWidgetCreator = class abstract
public
  function CreateWidget(widgetType:string): IWidget; virtual;
end;

implementation

function TAbstractWidgetCreator.CreateWidget(widgetType:string): IWidget;

begin
  // Case statement against AProductID. Descendants should add their own cases and call inherited as a fall through
   if widgetType = 'TMYButton' then
        result := TMyButton.Create
   else
   if widgetType = 'TMYLabel' then
        result := TMyLabel.Create
   else
   if widgetType = 'TMYImage' then
        result := TMyImage.Create
   else
        raise Exception.Create('Error CreateWidget()');

end;

{ TMyButton }

destructor TMyButton.destroy;
begin
  inherited;
end;

procedure TMyButton.printName;
begin
  Writeln('TMyButton');
end;

{ TMyImage }

procedure TMyImage.printName;
begin
  Writeln('TMyImage');
end;

{ TMyLabel }

procedure TMyLabel.printName;
begin
  Writeln('TMyLabel');
end;

{ TMyButtonFactory }

function TMyButtonFactory.CreateWidget(widgetType:string): IWidget;
begin
  result:=TMyButton.Create;
  result.printName();
end;

{ TMyLabelFactory }

function TMyLabelFactory.CreateWidget(widgetType: string): IWidget;
begin
  result:=TMyLabel.Create;
  result.printName();
end;

{ TMyImageFactory }

function TMyImageFactory.CreateWidget(widgetType: string): IWidget;
begin
   result:=TMYImage.Create;
   result.printName();
end;

end.
