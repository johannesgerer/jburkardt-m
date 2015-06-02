function zero_rc_test02 ( )

%*****************************************************************************80
%
%% ZERO_RC_TEST02 tests ROOTS_RC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2013
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  it_max = 30;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZERO_RC_TEST02\n' );
  fprintf ( 1, '  Test ROOTS_RC, which seeks a solution of\n' );
  fprintf ( 1, '  the N-dimensional nonlinear system F(X) = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       FERR          X\n' );
  fprintf ( 1, '\n' );
%
%  Initialization.
%
  q(1:2*n+2,1:n+2) = 0.0;

  xnew(1) = 1.2;
  xnew(2:n) = 1.0;

  it = 0;

  while ( 1 )

    x(1:n) = xnew(1:n);

    fx(1) = 1.0 - x(1);
    fx(2:n) = 10.0 * ( x(2:n) - x(1:n-1).^2 );

    if ( it == 0 )
      fprintf ( 1, '                ' );
    else
      fprintf ( 1, '  %14.6g', ferr );
    end
    for i = 1 : n
      fprintf ( 1, '  %14.6g', x(i) );
    end
    fprintf ( 1, '\n' );

    [ xnew, ferr, q ] = roots_rc ( n, x, fx, q );

    if ( ferr < 1.0E-07 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Sum of |f(x)| less than tolerance.\n' );
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Too many iterations!\n' );
      break
    end

    it = it + 1;

  end

  return
end
