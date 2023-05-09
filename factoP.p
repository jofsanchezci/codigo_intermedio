program factorial;
var
  number, result: integer;

function calculateFactorial(n: integer): integer;
var
  factorial: integer;
begin
  factorial := 1;
  while n > 1 do
  begin
    factorial := factorial * n;
    n := n - 1;
  end;
  return factorial;
end;

begin
  write("Enter a number: ");
  read(number);

  if number >= 0 then
  begin
    result := calculateFactorial(number);
    write("The factorial of ", number, " is ", result);
  end
  else
  begin
    write("Factorial is not defined for negative numbers");
  end;
end.
