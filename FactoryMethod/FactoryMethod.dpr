program FactoryMethod;

{/**
FactoryMethod - This pattern is useful when you want to encapsulate
the construction of a class and isolate knowledge of the concrete class
from the client application through an abstract interface.
In short, it�s a method that creates a product, the method must be overridden
by descendants to extend the base (or sometimes fail-over) product range.
**/}

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  FactoryMethodUnit in 'FactoryMethodUnit.pas';

var
  awc :TAbstractWidgetCreator;
  w1, w2, w3 :IWidget;
  wf1, wf2, wf3 :IWidgetFactory;
begin
  try
    awc:=TAbstractWidgetCreator.Create();
    w1:=awc.CreateWidget('TMYButton');
    w1.printName();
    w2:=awc.CreateWidget('TMYLabel');
    w2.printName();
    w3:=awc.CreateWidget('TMYImage');
    w3.printName();

    wf1:= TMyButtonFactory.Create;

    wf2:= TMyLabelFactory.Create;

    wf3:= TMyImageFactory.Create;


  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.
