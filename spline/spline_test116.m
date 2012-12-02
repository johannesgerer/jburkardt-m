function spline_test116 ( )

%*****************************************************************************80
%
%% TEST116 tests BPAB.
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
  a = 1.0E+00;
  b = 3.0E+00;
  nsample = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST116\n' );
  fprintf ( 1, '  BPAB evaluates the Bernstein basis polynomials\n' );
  fprintf ( 1, '  for the interval [A,B].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );

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

      bern(1:n+1) = bpab ( n, a, b, x );

      fprintf ( 1, '%8f    ', x );
      for j = 1 : n+1
        fprintf ( 1, '%14f', bern(j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
