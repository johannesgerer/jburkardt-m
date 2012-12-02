function [ add, mul, sub ] = setfld2 ( dummy )

%*****************************************************************************80
%
%% SETFLD2 sets up arithmetic tables for the finite field of order 2.
%
%  Discussion:
%
%    SETFLD2 sets up addition, multiplication, and subtraction tables
%    for the finite field of order 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer DUMMY, a dummy argument.
%
%    Output, integer ADD(2,2), MUL(2,2), SUB(2,2), the addition, 
%    multiplication, and subtraction tables, mod 2.
%
  q = 2;

  p = 2;

  for i = 0 : 1
    for j = 0 : 1
      add(i+1,j+1) = mod ( i + j, p );
    end
  end

  for i = 0 : 1
    for j = 0 : 1
      mul(i+1,j+1) = mod ( i * j, p );
    end
  end

  for i = 0 : 1
    for j = 0 : 1
      sub(add(i+1,j+1)+1, i+1) = j;
    end
  end

  return
end
