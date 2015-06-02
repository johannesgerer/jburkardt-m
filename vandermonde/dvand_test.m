function dvand_test ( )

%*****************************************************************************80
%
%% DVAND_TEST tests DVAND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DVAND_TEST:\n' );
  fprintf ( 1, '  Solve a Vandermonde linear system A''*x=b\n' );

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
    b = a' * x;
    r8vec_print ( n, b, '  Right hand side B:' );

    x = dvand ( n, alpha, b );
    r8vec_print ( n, x, '  Solution X:' );

  end

  return
end
