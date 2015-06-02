function zero_rc_test01 ( )

%*****************************************************************************80
%
%% ZERO_RC_TEST01 tests ROOT_RC.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZERO_RC_TEST01\n' );
  fprintf ( 1, '  Test ROOT_RC, which searches for an\n' );
  fprintf ( 1, '  approximate solution of F(X) = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X              XERR            FX              FERR\n' );
  fprintf ( 1, '\n' );
%
%  Initialization.
%
  it = 0;
  it_max = 30;
  q(1:9) = 0.0;
  x = - 2.1;
%
%  Each call takes one more step of improvement.
%
  while ( 1 )

    fx = cos ( x ) - x;

    if ( it == 0 )
      fprintf ( 1,'  %14.6g                  %14.6g\n', x, fx );
    else
      fprintf ( 1,'  %14.6g  %14.6g  %14.6g  %14.6g\n', x, xerr, fx, ferr );
    end

    [ x, ferr, xerr, q ] = root_rc ( x, fx, q );

    if ( ferr < 1.0E-08 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Uncertainty in F(X) less than tolerance.\n' );
      break
    end

    if ( xerr < 1.0E-08 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Width of X interal less than tolerance.\n' );
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
