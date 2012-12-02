function spline_test115 ( )

%*****************************************************************************80
%
%% TEST115 tests BP01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  n_max = 3;
  a = 0.0E+00;
  b = 1.0E+00;
  nsample = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST115\n' );
  fprintf ( 1, '  BP01 evaluates the Bernstein basis polynomials\n' );
  fprintf ( 1, '  for the interval [0,1].\n' );

  for n = 0 : n_max

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Degree N = %d\n', n );
    fprintf ( 1, '\n' );
    fprintf ( 1, ...
      '   X         BERN(N,0,X)  BERN(N,1,X)  BERN(N,2,X)  BERN(N,3,X)\n' );
    fprintf ( 1, '\n' ); 

    for i = 1 : nsample

      x = ( ( nsample - i     ) * a   ...
          + (           i - 1 ) * b ) ...
          / ( nsample     - 1 );

      bern(1:n+1) = bp01 ( n, x );

      fprintf ( 1, '%8f    ', x );
      for j = 1 : n+1
        fprintf ( 1, '%14f', bern(j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
