function result = sphere_unit_11_nd ( func, n )

%*****************************************************************************80
%
%% SPHERE_UNIT_11_ND: integral on the surface of the unit sphere in ND.
%
%  Discussion:
%
%    The integration region:
%
%      sum ( X(1:N)^2 ) = 1
%
%    An 2^N * ( N^2 + N + 1 ) point formula of degree 5 is used.
%
%    (For N = 3, the number of points is actually only 56, and
%     for N = 4, the number of points is actually only 240.)
%
%    One element of COEF31 was changed from
%      0.0236339091329 to
%      0.0236639091329
%    by Stroud, when going from his paper to his later textbook.
%    This correction was pointed out by David Wright, 16 February 2010.
%
%    One element of COEF21 was incorrectly transcribed.  The correct
%    value of COEF21(7) is 0.0337329118818D+00, as pointed out by
%    John Nolan, 23 April 2013.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    A Fifth Degree Integration Formula for the N-Simplex,
%    SIAM Journal on Numerical Analysis,
%    Volume 6, Number 1, March 1969.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X) at the N-dimensional point
%    X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.  For this routine,
%    it must be the case that 3 <= N <= 16.
%
%    Output, real RESULT, the approximate integral of the function.
%
  coef1 = [ ...
    0.0,              0.0, ...
    0.128571428571,   0.0518518518518, ...
    0.0211979378646,  0.281250000000, ...
    1.11934731935,    2.82751322751, ...
    5.68266145619,    9.93785824515, ...
    15.8196616478,    23.5285714285, ...
    33.2409299392,    45.1113811729, ...
    59.2754264177,    75.8518518518 ];
  coef21 = [ ...
    0.0,              0.0, ...
    0.163795782462,   0.0967270533860, ...
    0.0638253880175,  0.0452340041459, ...
    0.0337329118818,  0.0261275095270, ...
    0.0208331595340,  0.0169937111647, ...
    0.0141147212492,  0.0118949128383, ...
    0.0101424250926,  0.00873046796644, ...
    0.00757257014768, 0.00660813369775 ];
  coef22 = [ ...
    0.0,              0.0, ...
    0.126680408014,   0.0514210947621, ...
    0.0213579471658, -0.108726067638, ...
   -0.371589499738,  -0.786048144448, ...
   -1.36034060198,   -2.09547695631, ...
   -2.98784764467,   -4.03107480702, ...
   -5.21726499521,   -6.53783099707, ...
   -7.98401677102,   -9.54722261180 ];
  coef31 = [ ...
    0.0,              0.0, ...
    0.0,              0.0592592592592, ...
    0.0236639091329,  0.0525940190875, ...
    0.0925052768546,  0.141316953438, ...
    0.196818580052,   0.257027634179, ...
    0.320299222258,   0.385326226441, ...
    0.451098131789,   0.516849445559, ...
    0.582010515746,   0.646165210110 ];
  coef32 = [ ...
    0.0,              0.0, ...
    0.0,              0.0, ...
    0.0316246294890,  0.0207194729760, ...
    0.0144303800811,  0.0105348984135, ...
    0.00798435122193, 0.00623845929545, ...
    0.00499896882962, 0.00409176297655, ...
    0.00341037426698, 0.00288710646943, ...
    0.00247745182907, 0.00215128820597 ];

  if ( n < 3 | 16 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_UNIT_11_ND - Fatal error!\n' );
    fprintf ( 1, '  Input spatial dimension N out of range.\n' );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'SPHERE_UNIT_11_ND - Fatal error!' );
  end

  quad = 0.0;
%
%  S1
%
  x(1:n) = 1.0 / sqrt ( n );

  while ( 1 )

    quad = quad + coef1(n) * feval ( func, n, x );

    [ x, done ] = r8vec_mirror_next ( n, x );

    if ( done )
      break
    end

  end
%
%  S21
%
  r1 = ( ( n + 6 ) - 4.0 * sqrt ( 3.0 ) ) / ( n^2 + 12 * n - 12 );
  r1 = sqrt ( r1 );

  s1 = ( ( 7 * n - 6 ) + ( 4 * ( n - 1 ) ) * sqrt ( 3.0 ) ) ...
    / ( n^2 + 12 * n - 12 );
  s1 = sqrt ( s1 );

  for i = 1 : n

    x(1:n) = r1;
    x(i) = s1;

    while ( 1 )

      quad = quad + coef21(n) * feval ( func, n, x );

      [ x, done ] = r8vec_mirror_next ( n, x );

      if ( done )
        break
      end

    end

  end
%
%  S22
%
  r2 = ( ( n + 6 ) + 4.0 * sqrt ( 3.0 ) ) / ( n^2 + 12 * n - 12 );
  r2 = sqrt ( r2 );

  s2 = ( ( 7 * n - 6 ) - ( 4 * ( n - 1 ) ) * sqrt ( 3.0 ) ) ...
    / ( n^2 + 12 * n - 12 );
  s2 = sqrt ( s2 );

  for i = 1 : n

    x(1:n) = r2;
    x(i) = s2;

    while ( 1 )

      quad = quad + coef22(n) * feval ( func, n, x );

      [ x, done ] = r8vec_mirror_next ( n, x );

      if ( done )
        break
      end

    end

  end
%
%  S31
%
  u1 = ( ( n + 12 ) + 8.0 * sqrt ( 3.0 ) ) / ( n^2 + 24 * n - 48 );
  u1 = sqrt ( u1 );

  v1 = ( ( 7 * n - 12 ) - ( 4 * n - 8 ) * sqrt ( 3.0 ) ) / ( n^2 + 24 * n - 48 );
  v1 = sqrt ( v1 );

  for i = 1 : n - 1

    for j = i + 1 : n

      x(1:n) = u1;
      x(i) = v1;
      x(j) = v1;

      while ( 1 )

        quad = quad + coef31(n) * feval ( func, n, x );

        [ x, done ] = r8vec_mirror_next ( n, x );

        if ( done )
          break
        end

      end

    end

  end
%
%  S32
%
  u2 = ( ( n + 12 ) - 8.0 * sqrt ( 3.0 ) ) / ( n^2 + 24 * n - 48 );
  u2 = sqrt ( u2 );

  v2 = ( ( 7 * n - 12 ) + ( 4 * n - 8 ) * sqrt ( 3.0 ) ) / ( n^2 + 24 * n - 48 );
  v2 = sqrt ( v2 );

  for i = 1 : n - 1

    for j = i + 1 : n

      x(1:n) = u2;
      x(i) = v2;
      x(j) = v2;

      while ( 1 )

        quad = quad + coef32(n) * feval ( func, n, x );

        [ x, done ] = r8vec_mirror_next ( n, x );

        if ( done )
          break
        end
      end

    end

  end

  area = sphere_unit_area_nd ( n );
  result = quad * area / 2.0^n;

  return
end
