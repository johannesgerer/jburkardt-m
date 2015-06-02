function pvandprg_test ( )

%*****************************************************************************80
%
%% PVANDPRG_TEST tests PVANDPRG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PVANDPRG_TEST:\n' );
  fprintf ( 1, '  Solve a Vandermonde linear system A*x=b\n' );
  fprintf ( 1, '  progressively.\n' );
  fprintf ( 1, '  First we use ALPHA = 0, 1, 2, 3, 4.\n' );
  fprintf ( 1, '  Then we choose ALPHA at random.\n' );

  n = 5;

  for test = 1 : 2

    if ( test == 1 )
      alpha = [ 0.0; 1.0; 2.0; 3.0; 4.0 ];
    elseif ( test == 2 )
      alpha = rand ( n, 1 );
    end

    r8vec_print ( n, alpha, '  Vandermonde vector ALPHA:' );

    a = vand1 ( n, alpha );

    x = [ 5.0; 3.0; 4.0; 1.0; 2.0 ];
    b = a * x;
    r8vec_print ( n, b, '  Right hand side B:' );

    x = zeros ( n, 1 );
    c = zeros ( n, 1 );
    m = zeros ( n, 1 );

    for nsub = 1 : n
      [ x, c, m ] = pvandprg ( nsub, alpha, b, x, c, m );
      r8vec_print ( nsub, x, '  Solution X:' );
    end

  end

  return
end
