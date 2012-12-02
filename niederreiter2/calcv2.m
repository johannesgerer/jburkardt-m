function [ pc_deg, pc, v ] = calcv2 ( maxv, px_deg, px, add, mul, sub, b_deg, b )

%*****************************************************************************80
%
%% CALCV2 calculates the constants V(J,R).
%
%  Discussion:
%
%    This program calculates the values of the constants V(J,R) as
%    described in the reference (BFN) section 3.3.  It is called from
%    either CALCC or CALCC2.
%
%    Polynomials stored as arrays have the coefficient of degree N
%    in POLY(N+1).
%
%    A polynomial which is identically 0 is given degree -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Harald Niederreiter,
%    Algorithm 738:
%    Programs to Generate Niederreiter's Low-Discrepancy Sequences,
%    ACM Transactions on Mathematical Software,
%    Volume 20, Number 4, pages 494-495, 1994.
%
%  Parameters:
%
%    Input, integer MAXV gives the dimension of the array V.
%
%    Input, integer PX_DEG, the degree of polynomial PX.
%
%    Input, integer PX(PXDEG+1), the appropriate irreducible polynomial
%    for the dimension currently being considered.  The degree of PX
%    will be called E.
%
%    Input, integer ADD(2,2), MUL(2,2), SUB(2,2), the addition, multiplication, 
%    and subtraction tables, mod 2.
%
%    Input, integer B_DEG, the degree of the polynomial B.
%
%    Input, integer B(B_DEG+1), the polynomial defined in section 2.3 of BFN.  
%    The degree of B implicitly define the parameter J of section 3.3, 
%    by degree(B) = E*(J-1).  On output,
%    B has been multiplied by PX, so its degree is now E * J.
%
%    Output, integer PC_DEG, the degree of the polynomial C = B * PX.
%
%    Output, integer PC(PC_DEG+1), the polynomial C = B * PX.
%
%    Output, integer V(MAXV+1), the computed V array.
%
%  Local Parameters:
%
%    Local, integer ARBIT, indicates where the user can place
%    an arbitrary element of the field of order 2.  This means
%    0 <= ARBIT < 2.
%
%    Local, integer BIGM, is the M used in section 3.3.
%    It differs from the [little] m used in section 2.3,
%    denoted here by M.
%
%    Local, integer NONZER, shows where the user must put an arbitrary
%    non-zero element of the field.  For the code, this means
%    0 < NONZER < 2.
%
  arbit = 1;
  nonzer = 1;

  e = px_deg;
%
%  The polynomial B is PX**(J-1).
%
%  In section 3.3, the values of Hi are defined with a minus sign:
%  don't forget this if you use them later!
%
  bigm = b_deg;
%
%  Multiply B by PX to compute PC = PX**J.
%  In section 2.3, the values of Bi are defined with a minus sign:
%  don't forget this if you use them later!
%
  [ pc_deg, pc ] = plymul2 ( add, mul, px_deg, px, b_deg, b );

  m = pc_deg;
%
%  We don't use J explicitly anywhere, but here it is just in case.
%
  j = m / e;
%
%  Now choose a value of Kj as defined in section 3.3.
%  We must have 0 <= Kj < E*J = M.
%  The limit condition on Kj does not seem very relevant
%  in this program.
%
  kj = bigm;
%
%  Choose values of V in accordance with the conditions in section 3.3.
%
  for r = 0 : kj-1
    v(r+1) = 0;
  end
  v(kj+1) = 1;

  if ( kj < bigm )

    term = sub ( 0+1, b(kj+1)+1 );
%
%  Check the condition of section 3.3,
%  remembering that the B's have the opposite sign.
%
    for r = kj+1 : bigm-1
      v(r+1) = arbit;
      term = sub ( term+1, mul ( b(r+1)+1, v(r+1)+1 )+1 );
    end
%
%  Now V(BIGM) is anything but TERM.
%
    v(bigm+1) = add ( nonzer+1, term+1 );

    for r = bigm+1 : m-1
      v(r+1) = arbit;
    end

  else

    for r = kj+1 : m-1
      v(r+1) = arbit;
    end

  end
%
%  Calculate the remaining V's using the recursion of section 2.3,
%  remembering that the PC's have the opposite sign.
%
  for r = 0 : maxv-m
    term = 0;
    for i = 0 : m-1
      term = sub ( term+1, mul ( pc(i+1)+1, v(r+i+1)+1 )+1 );
    end
    v(r+m+1) = term;
  end

  return
end
