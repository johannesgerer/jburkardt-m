function [ pc_deg, pc ] = plymul2 ( add, mul, pa_deg, pa, pb_deg, pb )

%*****************************************************************************80
%
%% PLYMUL2 multiplies two polynomials in the field of order 2.
%
%  Discussion:
%
%    Polynomials stored as arrays have the coefficient of degree N in POLY(N+1).
%
%    A polynomial which is identically 0 is given degree -1.
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
%    Input, integer ADD(2,2), MUL(2,2), the addition and multiplication 
%    tables, mod 2.
%
%    Input, integer PA_DEG, the degree of polynomial A.
%
%    Input, integer PA(PA_DEG+1), the coefficients of polynomial A.
%
%    Input, integer PB_DEG, the degree of polynomial B.
%
%    Input, integer PB(PB_DEG+1), the coefficients of polynomial B.
%
%    Output, integer PC_DEG, the degree of polynomial C.
%
%    Output, integer PC(PC_DEG+1), the product polynomial, C = A * B mod 2.
%
  if ( pa_deg == -1 | pb_deg == -1 )
    pc_deg = -1;
  else
    pc_deg = pa_deg + pb_deg;
  end

  for i = 0 : pc_deg
    term = 0;
    for j = max ( 0, i-pa_deg ) : min ( pb_deg, i )
      term = add ( term+1, mul ( pa(i-j+1)+1, pb(j+1)+1 ) + 1 );
    end
    pt(i+1) = term;
  end

  for i = 0 : pc_deg
    pc(i+1) = pt(i+1);
  end

  return
end
