function result = cube_shell_nd ( func, n, r1, r2 )

%*****************************************************************************80
%
%% CUBE_SHELL_ND approximates an integral inside a cubic shell in N dimensions.
%
%  Integration region:
%
%    R1 <= abs ( X(1:N) ) <= R2
%
%  Discussion:
%
%    An N*2**N point third degree formula is used, Stroud number CNSHELL:3-4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F at the N-vector X, of the form
%      function value = func ( n, x )
%
%    Input, integer N, the dimension of the space.
%
%    Input, real R1, R2, the inner and outer radii of the cubical
%    shell.  The outer cube is of side 2*R2, the inner, missing cube of side
%    2*R1.
%
%    Output, real RESULT, the approximate integral of the function.
%
  if ( r1 == r2 )
    result = 0.0E+00;
    return
  end

  u = sqrt ( n * ( r2^(n+2) - r1^(n+2) ) / ( ( n + 2 ) * ( r2^n - r1^n ) ) );
  v = u / sqrt ( 3.0E+00 );

  quad = 0.0E+00;
  for i = 1 : n

    x(1:n) = v;
    x(i) = u;

    while ( 1 )

      quad = quad + feval ( func, n, x );

      [ x, done ] = r8vec_mirror_next ( n, x );

      if ( done )
        break
      end

    end

  end

  quad = quad / ( n * 2^n );

  volume = cube_shell_volume_nd ( n, r1, r2 );
  result = quad * volume;

  return
end
