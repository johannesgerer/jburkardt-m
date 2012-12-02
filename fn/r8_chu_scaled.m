function value = r8_chu_scaled ( a, b, z )

%*****************************************************************************80
%
%% R8_CHU_SCALED: scaled confluent hypergeometric function of R8 arguments.
%
%  Discussion:
%
%    Evaluate, for large z, z^a * u(a,b,z)  where U is the logarithmic
%    confluent hypergeometric function.  A rational approximation due to
%    Y L Luke is used.  When U is not in the asymptotic region, that is, when A
%    or B is large compared with Z, considerable significance loss occurs.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real A, B, the parameters.
%
%    Input, real Z, the argument.
%
%    Output, real VALUE, the function value.
%
  persistent eps
  persistent sqeps

  if ( isempty ( eps ) )
    eps = 4.0 * r8_mach ( 4 );
    sqeps = sqrt ( r8_mach ( 4 ) );
  end

  bp = 1.0 + a - b;
  ab = a * bp;
  ct2 = 2.0 * ( z - ab );
  sab = a + bp;

  bb(1) = 1.0;
  aa(1) = 1.0;

  ct3 = sab + 1.0 + ab;
  bb(2) = 1.0 + 2.0 * z / ct3;
  aa(2) = 1.0 + ct2 / ct3;

  anbn = ct3 + sab + 3.0;
  ct1 = 1.0 + 2.0 * z / anbn;
  bb(3) = 1.0 + 6.0 * ct1 * z / ct3;
  aa(3) = 1.0 + 6.0 * ab / anbn + 3.0 * ct1 * ct2 / ct3;

  for i = 4 : 300

    x2i1 = 2 * i - 3;
    ct1 = x2i1 / ( x2i1 - 2.0 );
    anbn = anbn + x2i1 + sab;
    ct2 = ( x2i1 - 1.0 ) /anbn;
    c2 = x2i1 * ct2 - 1.0;
    d1z = x2i1 * 2.0 * z / anbn;

    ct3 = sab * ct2;
    g1 = d1z + ct1 * ( c2 + ct3 );
    g2 = d1z - c2;
    g3 = ct1 * ( 1.0 - ct3 - 2.0 * ct2 );

    bb(4) = g1 * bb(3) + g2 * bb(2) + g3 * bb(1);
    aa(4) = g1 * aa(3) + g2 * aa(2) + g3 * aa(1);

    value = aa(4) / bb(4);

    if ( abs ( value - aa(1) / bb(1) ) < eps * abs ( value ) )
      return
    end

    for j = 1 : 3
      aa(j) = aa(j+1);
      bb(j) = bb(j+1);
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_CHU_SCALED - Fatal error!\n' );
  fprintf ( 1, '  No convergence after 300 terms.\n' );
  error ( 'R8_CHU_SCALED - Fatal error!' )

end
