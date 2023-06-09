        ��  ��                  �      �� ��               <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
 <assemblyIdentity version="1.0.0.0" processorArchitecture="*" name="CompanyName.ProductName.AppName" type="win32"/>
 <description>Your application description.</description>
 <dependency>
  <dependentAssembly>
   <assemblyIdentity type="win32" name="Microsoft.Windows.Common-Controls" version="6.0.0.0" processorArchitecture="*" publicKeyToken="6595b64144ccf1df" language="*"/>
  </dependentAssembly>
 </dependency>
 <trustInfo xmlns="urn:schemas-microsoft-com:asm.v3">
  <security>
   <requestedPrivileges>
    <requestedExecutionLevel level="asInvoker" uiAccess="false"/>
   </requestedPrivileges>
  </security>
 </trustInfo>
 <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
  <application>
   <!-- Windows Vista -->
   <supportedOS Id="{e2011457-1546-43c5-a5fe-008deee3d3f0}" />
   <!-- Windows 7 -->
   <supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}" />
   <!-- Windows 8 -->
   <supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}" />
   <!-- Windows 8.1 -->
   <supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}" />
   <!-- Windows 10 -->
   <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
   </application>
  </compatibility>
 <asmv3:application xmlns:asmv3="urn:schemas-microsoft-com:asm.v3">
  <asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
   <dpiAware>True</dpiAware>
  </asmv3:windowsSettings>
  <asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">
   
   <longPathAware>false</longPathAware>
   
  </asmv3:windowsSettings>
 </asmv3:application>
</assembly>   0   �� M A I N I C O N                              �     4   ��
 S E C T I O N - A 0                   {
  Description: ADimPas library.

  Copyright (C) 2023 Melchiorre Caruso <melchiorrecaruso@gmail.com>
    
  This library is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with this program. If not, see <http://www.gnu.org/licenses/>.
} S  4   ��
 S E C T I O N - A 1                   unit ADim;

{$H+}{$modeSwitch advancedRecords}  
{$WARN NO_RETVAL OFF}

interface

uses SysUtils;

type 
  { Prefixes }
  TPrefix = (pTera, pGiga, pMega, pKilo, pHecto, pDeca, pNone, pDeci, 
    pCenti, pMilli, pMicro, pNano, pPico, pDay, pHour, pMinute);

  { TQuantity }
  generic TQuantity<U> = record
    type TSelf = specialize TQuantity<U>;
    type TPrefixes = array of TPrefix; 
  private
    FValue: double;
  public
    function Abs: TSelf;
    function Value: double;
    function ToString: string;
    function ToVerboseString: string;
    function ToString(Precision, Digits: longint; const Prefixes: TPrefixes): string;
    function ToVerboseString(Precision, Digits: longint; const Prefixes: TPrefixes): string;
    class operator +  (const ALeft, ARight: TSelf): TSelf;
    class operator -  (const ALeft, ARight: TSelf): TSelf;
    class operator *  (const AValue: double; const ASelf: TSelf): TSelf;
    class operator *  (const ASelf: TSelf; const AValue: double): TSelf;
    class operator /  (const ASelf: TSelf; const AValue: double): TSelf;
    class operator /  (const ALeft, ARight: TSelf): double;
    class operator mod(const ALeft, ARight: TSelf): TSelf;    
    class operator =  (const ALeft, ARight: TSelf): boolean;
    class operator <  (const ALeft, ARight: TSelf): boolean;
    class operator >  (const ALeft, ARight: TSelf): boolean;
    class operator <= (const ALeft, ARight: TSelf): boolean;
    class operator >= (const ALeft, ARight: TSelf): boolean;
  end;

  { TUnitId }
  generic TUnitId<U> = record
    type TSelf = specialize TUnitId<U>;
    type TBaseQuantity = specialize TQuantity<U>;
  public
    class function From(const AQuantity: TBaseQuantity): TBaseQuantity; inline; static;
    class operator *(const AValue: double; const {%H-}ASelf: TSelf): TBaseQuantity;
  end;
  
   4   ��
 S E C T I O N - A 4                   { Trigonometric functions } 

function Cos(const AQuantity: TRadians): double;
function Sin(const AQuantity: TRadians): double;
function Tan(const AQuantity: TRadians): double;
function Cotan(const AQuantity: TRadians): double;
function Secant(const AQuantity: TRadians): double;
function Cosecant(const AQuantity: TRadians): double;

function ArcCos(const AValue: double): TRadians;
function ArcSin(const AValue: double): TRadians;
function ArcTan(const AValue: double): TRadians;
function ArcTan2(const x, y: double): TRadians;
 �#  4   ��
 S E C T I O N - B 1                   
const
  PrefixTable: array[pTera..pMinute] of 
    record  Symbol, Name: string; Factor: double end = (
    (Symbol: 'T';   Name: 'tera';   Factor: 1E+12),
    (Symbol: 'G';   Name: 'giga';   Factor: 1E+09),
    (Symbol: 'M';   Name: 'mega';   Factor: 1E+06),
    (Symbol: 'k';   Name: 'kilo';   Factor: 1E+03),
    (Symbol: 'h';   Name: 'hecto';  Factor: 1E+02),
    (Symbol: 'da';  Name: 'deca';   Factor: 1E+01),
    (Symbol: '';    Name:  '';      Factor: 1E+00),
    (Symbol: 'd';   Name: 'deci';   Factor: 1E-01),
    (Symbol: 'c';   Name: 'centi';  Factor: 1E-02),
    (Symbol: 'm';   Name: 'milli';  Factor: 1E-03),
    (Symbol: 'μ';   Name: 'micro';  Factor: 1E-06),
    (Symbol: 'n';   Name: 'nano';   Factor: 1E-09),
    (Symbol: 'p';   Name: 'pico';   Factor: 1E-12),
    (Symbol: 'd';   Name: 'day';    Factor: 86400),
    (Symbol: 'h';   Name: 'hour';   Factor: 3600 ),
    (Symbol: 'min'; Name: 'minute'; Factor: 60   )
  );

function Split(const AStr: string): TStringArray;

implementation

uses Math;

function Split(const AStr: string): TStringArray;
var
  I, Index: longint;
begin
  result := nil;
  Index  := 0;
  SetLength(result, Index + 10);
  for I := low(AStr) to high(AStr) do
  begin
    if (AStr[I] in ['.', '/', ' ']) then
    begin
      Inc(Index);
      if Index = Length(result) then
        SetLength(result, Index + 10);
      if AStr[I] <> ' ' then
      begin
        result[Index] := AStr[I];
        Inc(Index);
        if Index = Length(result) then
           SetLength(result, Index + 10);
      end;
      result[Index] := '';
    end else
      result[Index] := result[Index] + AStr[I];
  end;
  SetLength(result, Index + 1);
end;

{ TQuantity }

function TQuantity.Abs: TSelf;
begin
  result.FValue := System.Abs(FValue);
end;

function TQuantity.Value: double;
begin
  result := FValue;
end;

function TQuantity.ToString: string;
begin
  result := FloatToStr(FValue) + ' ' + U.Symbol;
end;

function TQuantity.ToVerboseString: string;
begin
  result := FloatToStr(FValue) + ' ' + U.Name;
end;

function TQuantity.ToString(Precision, Digits: longint; const Prefixes: TPrefixes): string;
var
  Exponent: longint;
  Return: double;
  I, Index: longint;
  Prefix: TPrefix;
  SubStr: TStringArray;
begin
  Return   := FValue;
  Exponent := 1;
  Index    := Low(Prefixes);
  if Index <= High(Prefixes) then
    Prefix := Prefixes[Index]
  else
    Prefix := pNone;

  SubStr := Split(U.Symbol);
  for I := Low(SubStr) to High(SubStr) do
  begin
    if (SubStr[I] = '/') then Exponent := -1 else
    if (SubStr[I] = '.') then Exponent := +1 
      else
      begin

        if SubStr[I][length(SubStr[I])] in ['2', '3', '4', '5', '6'] then
          Exponent := Exponent * StrToInt(SubStr[I][length(SubStr[I])]); 
           
        if (SubStr[I] = TSecondUnit.Symbol) or 
           (SubStr[I] = TSquareSecondUnit.Symbol) then
        begin

          if Prefix in [pDay, pHour, pMinute] then
          begin
            SubStr[I] := PrefixTable[Prefix].Symbol;
            Return    := Return / IntPower(PrefixTable[Prefix].Factor, Exponent);
          end else
            if Prefix in [pDeci, pCenti, pMilli, pMicro, pNano, pPico] then
            begin
              SubStr[I] := PrefixTable[Prefix].Symbol + SubStr[I];
              Return    := Return / IntPower(PrefixTable[Prefix].Factor, Exponent);
            end else
              Prefix := pNone;

        end else
          if not (Prefix in [pDay, pHour, pMinute]) then
          begin
          
            if (SubStr[I] = TKilogramUnit.Symbol) or 
               (SubStr[I] = TSquareKilogramUnit.Symbol) then
            begin      
              if Prefix <> pKilo then
              begin
                SubStr[I] := Copy(SubStr[I], 2, Length(SubStr[I]));  
                Return := Return * IntPower(1000, Exponent); 
              end else
                Prefix := pNone; 
            end;

            if Prefix <> pNone then 
            begin
              SubStr[I] := PrefixTable[Prefix].Symbol + SubStr[I];
              Return    := Return / IntPower(PrefixTable[Prefix].Factor, Exponent);
            end;  
          end;
        
        Exponent := 1;
        Index    := Index + 1;
        if Index <= High(Prefixes) then
          Prefix := Prefixes[Index]
        else
          Prefix := pNone;
      end;
  end;

  result := FloatToStrF(Return, ffGeneral, Precision, Digits) + ' ';
  for I := Low(SubStr) to High(SubStr) do
  begin
    result := result + SubStr[I];
  end;
  SubStr := nil;
end;

function TQuantity.ToVerboseString(Precision, Digits: longint; const Prefixes: TPrefixes): string;
var
  Exponent: longint;
  Return: double;
  I, Index: longint;
  Prefix: TPrefix;
  SubStr: TStringArray;
begin
  Return   := FValue;
  Exponent := 1;
  Index    := Low(Prefixes);
  if Index <= High(Prefixes) then
    Prefix := Prefixes[Index]
  else
    Prefix := pNone;

  SubStr := Split(U.Name);
  for I := Low(SubStr) to High(SubStr) do
  begin

    if (SubStr[I] = 'per'    ) then Exponent := -1           else
    if (SubStr[I] = 'square' ) then Exponent := Exponent * 2 else
    if (SubStr[I] = 'cubic'  ) then Exponent := Exponent * 3 else
    if (SubStr[I] = 'quartic') then Exponent := Exponent * 4 else
    if (SubStr[I] = 'quintic') then Exponent := Exponent * 5 else
    if (SubStr[I] = 'sextic' ) then Exponent := Exponent * 6
      else
      begin

        if (SubStr[I] = TSecondUnit.Name) then
        begin

          if Prefix in [pDay, pHour, pMinute] then
          begin
            SubStr[I] := PrefixTable[Prefix].Symbol;
            Return    := Return / IntPower(PrefixTable[Prefix].Factor, Exponent);
          end else
            if Prefix in [pDeci, pCenti, pMilli, pMicro, pNano, pPico] then
            begin
              SubStr[I] := PrefixTable[Prefix].Symbol + SubStr[I];
              Return    := Return / IntPower(PrefixTable[Prefix].Factor, Exponent);
            end else
              Prefix := pNone;        

        end else
          if not (Prefix in [pDay, pHour, pMinute]) then
          begin
          
            if (SubStr[I] = TKilogramUnit.Name) then
            begin      
              if Prefix <> pKilo then
              begin
                SubStr[I] := 'gram';
                Return := Return * IntPower(1000, Exponent); 
              end else
                Prefix := pNone;                 
            end;

            if Prefix <> pNone then 
            begin
              SubStr[I] := PrefixTable[Prefix].Symbol + SubStr[I];
              Return := Return / IntPower(PrefixTable[Prefix].Factor, Exponent);
            end;  
          end;

        Exponent := 1;
        Index    := Index + 1;
        if Index <= High(Prefixes) then
          Prefix := Prefixes[Index]
        else
          Prefix := pNone;
      end;
  end;

  result := FloatToStrF(Return, ffGeneral, Precision, Digits);
  for I := Low(SubStr) to High(SubStr) do
  begin
    result := result + ' ' + SubStr[I];
  end;
  SubStr := nil;
end;                                             

class operator TQuantity.+(const ALeft, ARight: TSelf): TSelf;
begin
  result.FValue := ALeft.FValue + ARight.FValue;
end;

class operator TQuantity.-(const ALeft, ARight: TSelf): TSelf;
begin
  result.FValue := ALeft.FValue - ARight.FValue;
end;

class operator TQuantity.*(const AValue: double; const ASelf: TSelf): TSelf;
begin
  result.FValue := AValue * ASelf.FValue;
end;

class operator TQuantity.*(const ASelf: TSelf; const AValue: double): TSelf;
begin
  result.FValue := ASelf.FValue * AValue;
end;

class operator TQuantity./(const ASelf: TSelf; const AValue: double): TSelf;
begin
  result.FValue := ASelf.FValue / AValue;
end;

class operator TQuantity./(const ALeft, ARight: TSelf): double;
begin
  result := ALeft.FValue / ARight.FValue;
end;

class operator TQuantity.mod(const ALeft, ARight: TSelf): TSelf;
begin
  result.FValue := ALeft.FValue mod ARight.FValue;
end;

class operator TQuantity.=(const ALeft, ARight: TSelf): boolean;
begin
  result := ALeft.FValue = ARight.FValue;
end;

class operator TQuantity.<(const ALeft, ARight: TSelf): boolean;
begin
  result := ALeft.FValue < ARight.FValue;
end;

class operator TQuantity.>(const ALeft, ARight: TSelf): boolean;
begin
  result := ALeft.FValue > ARight.FValue;
end;

class operator TQuantity.<=(const ALeft, ARight: TSelf): boolean;
begin
  result := ALeft.FValue <= ARight.FValue;
end;

class operator TQuantity.>=(const ALeft, ARight: TSelf): boolean;
begin
  result := ALeft.FValue >= ARight.FValue;
end;

{ TUnitId }

class function TUnitId.From(const AQuantity: TBaseQuantity): TBaseQuantity;
begin
  result.FValue := AQuantity.FValue;
end;

class operator TUnitId.*(const AValue: double; const ASelf: TSelf): TBaseQuantity;
begin
  result.FValue := AValue;
end;
   Z  4   ��
 S E C T I O N - B 4                   { Trigonometric functions } 

function Cos(const AQuantity: TRadians): double;
begin
  result := System.Cos(AQuantity.FValue);
end;

function Sin(const AQuantity: TRadians): double;
begin
  result := System.Sin(AQuantity.FValue);
end;

function Tan(const AQuantity: TRadians): double;
begin
  result := Math.Tan(AQuantity.FValue);
end;

function Cotan(const AQuantity: TRadians): double;
begin
  result := Math.Cotan(AQuantity.FValue);
end;

function Secant(const AQuantity: TRadians): double;
begin
  result := Math.Secant(AQuantity.FValue);
end;

function Cosecant(const AQuantity: TRadians): double;
begin
  result := Math.Cosecant(AQuantity.FValue);
end;

function ArcCos(const AValue: double): TRadians;
begin
  result.FValue := Math.ArcCos(AValue);
end;

function ArcSin(const AValue: double): TRadians;
begin
  result.FValue := Math.ArcSin(AValue);
end;

function ArcTan(const AValue: double): TRadians;
begin
  result.FValue := System.ArcTan(AValue);
end;

function ArcTan2(const x, y: double): TRadians;
begin
  result.FValue := Math.ArcTan2(x, y);
end;
  �      �� ��               (       @             d   d                                                                                                                                                                                                                                                                                           Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu����������ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ�������������Ӥu�                                    Ӥu����������ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ��ݻ�������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu����������ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ�������������Ӥu�                                    Ӥu����������ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ��ԧ�������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu�������������������������������������������������������������������������������������Ӥu�                                    Ӥu���������������������������������������������������������������������������������޻��ը|�                                    Ӥu�����������������������������������������������������������������������������޼��֨{�ےm                                    Ӥu�������������������������������������������������������������������������޼��֨{�ےm                                        Ӥu���������������������������������������������������������������������޼��֨{�ےm                                            Ӥu�����������������������������������������������������������������޽��֨|�ےm                                                Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�Ӥu�֩}�ժ�                                                                                                                                                                                                                                                                                                                                                                                                                                    