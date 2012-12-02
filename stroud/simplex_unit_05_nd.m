function result = simplex_unit_05_nd ( func, n )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_05_ND approximates an integral inside a unit simplex in ND.
%
%  Integration region:
%
%    The unit simplex in N dimensions,
%      0 <= X(1:N),
%      Sum ( X(1:N) ) <= 1.
%
%  Discussion:
%
%    An N^2 + 3 N + 3 point formula of degree 5 is used.  This is
%    Stroud formula TN:5-1.
%
%    (For N = 2, the number of points is actually only 7, and
%     for N = 3, the number of points is actually only 15.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    A Fifth Degree Integration Formula for the N-Simplex,
%    SIAM Journal on Numerical Analysis,
%    Volume 6, Number 1, March 1969.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X) at the N-dimensional point
%    X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.  For this routine,
%    it must be the case that 2 <= N <= 16.
%
%    Output, real RESULT, the approximate integral of the function.
%
  coef1 = [ ...
    0.0E+00,             0.225E+00, ...
    0.118518518519E+00,  0.0631521898883E+00, ...
    0.235714285714E+00,  0.791575476992E+00, ...
    1.85798728021E+00,   3.53666958042E+00, ...
    5.90844340844E+00,   9.03765432098E+00, ...
    12.9758241758E+00,  17.7645108738E+00, ...
    23.4375030259E+00,  30.0224941950E+00, ...
    37.5423613501E+00,  46.0161454949E+00 ];
  coef21 = [ ...
    0.0E+00,              0.12593918054483E+00, ...
    0.0719370837790E+00,  0.0470456145702E+00, ...
    0.0333009774677E+00,  0.0248633014592E+00, ...
    0.0192679696358E+00,  0.0153322153879E+00, ...
    0.0124316229901E+00,  0.0102112988361E+00, ...
    0.00845730697460E+00, 0.00703433430999E+00, ...
    0.00585330520067E+00, 0.00485356735291E+00, ...
    0.00399261092720E+00, 0.00323988713017E+00 ];
  coef22 = [ ...
    0.0E+00,              0.13239415278851E+00, ...
    0.0690682072263E+00,  0.0371530185868E+00, ...
   -0.0719253160920E+00, -0.264323879461E+00, ...
   -0.537926779961E+00,  -0.886895605701E+00, ...
   -1.30409181465E+00,   -1.78227048964E+00, ...
   -2.31462336314E+00,   -2.89499045158E+00, ...
   -3.51790849765E+00,   -4.17858310668E+00, ...
   -4.87282884913E+00,   -5.59699944261E+00 ];
  coef31 = [ ...
    0.0E+00,             0.0E+00, ...
    0.0529100529100E+00, 0.0261368740713E+00, ...
    0.0499020181331E+00, 0.0782233395867E+00, ...
    0.109041040862E+00,  0.140874828568E+00,  ...
    0.172735353396E+00,  0.203992490408E+00,  ...
    0.234263814181E+00,  0.263332763315E+00,  ...
    0.291091849264E+00,  0.317504208212E+00,  ...
    0.342577872069E+00,  0.366348654344E+00 ];
  coef32 = [ ...
    0.0E+00,              0.0E+00, ...
    0.0E+00,              0.0254485903613E+00, ...
    0.0165000982690E+00,  0.0115218303668E+00,  ...
    0.00850478779483E+00, 0.00655297510968E+00, ...
    0.00522372456259E+00, 0.00428017828134E+00, ...
    0.00358722367033E+00, 0.00306362964360E+00, ...
    0.00265836687133E+00, 0.00233816221525E+00, ...
    0.00208061510846E+00, 0.00187022027571E+00 ];

  if ( n < 2 | 16 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SIMPLEX_UNIT_05_ND - Fatal error!\n' );
    fprintf ( 1, '  Input spatial dimension N out of range.\n' );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'SIMPLEX_UNIT_05_ND - Fatal error!' );
  end

  quad = 0.0;
%
%  S1
%
  x(1:n) = 1.0E+00 / ( n + 1 );
  quad = quad + coef1(n) * feval ( func, n, x );
%
%  S21
%
  r1 = ( ( n + 4 ) - sqrt ( 15.0E+00 ) ) / ( n * n + 8 * n + 1 );
  s1 = 1.0E+00 - n * r1;

  x(1:n) = r1;

  for i = 1 : n + 1

    quad = quad + coef21(n) * feval ( func, n, x );

    if ( 1 < i )
      x(i-1) = r1;
    end

    if ( i < n + 1 )
      x(i) = s1;
    end

  end
%
%  S22
%
  r2 = ( n + 4 + sqrt ( 15.0E+00 ) ) / ( n * n + 8 * n + 1 );
  s2 = 1.0E+00 - n * r2;

  x(1:n) = r2;

  for i = 1 : n + 1

    quad = quad + coef22(n) * feval ( func, n, x );

    if ( 1 < i )
      x(i-1) = r2;
    end

    if ( i < n + 1 )
      x(i) = s2;
    end

  end
%
%  S31
%
  u1 = ( n + 7 + 2.0E+00 * sqrt ( 15.0E+00 ) ) / ( n * n + 14 * n - 11 );
  v1 = ( ( 4 * n - 2 ) - ( n - 1 ) * sqrt ( 15.0E+00 ) ) / ( n * n + 14 * n - 11 );

  for i = 1 : n

    x(1:n) = u1;
    x(i) = v1;

    for j = i : n

      if ( i < j - 1 )
        x(j-1) = u1;
      end

      x(j) = v1;

      quad = quad + coef31(n) * feval ( func, n, x );

    end

  end
%
%  S32
%
  u2 = ( n + 7 - 2.0E+00 * sqrt ( 15.0E+00 ) ) / ( n^2 + 14 * n - 11 );
  v2 = ( ( 4 * n - 2 ) + ( n - 1 ) * sqrt ( 15.0E+00 ) ) / ( n^2 + 14 * n - 11 );

  for i = 1 : n

    x(1:n) = u2;
    x(i) = v2;

    for j = i : n

      if ( i < j - 1 )
        x(j-1) = u2;
      end

      x(j) = v2;

      quad = quad + coef32(n) * feval ( func, n, x );

    end

  end

  volume = simplex_unit_volume_nd ( n );

  result = quad * volume;

  return
end
