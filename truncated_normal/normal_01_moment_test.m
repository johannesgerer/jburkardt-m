function normal_01_moment_test ( )

%*****************************************************************************80
%
%% NORMAL_01_MOMENT_TEST tests NORMAL_01_MOMENT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_MOMENT_TEST\n' );
  fprintf ( 1, '  NORMAL_01_MOMENT evaluates moments of the Normal 01 PDF;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Order          Moment\n' );
  fprintf ( 1, '\n' );

  for order = 0 : 10

    moment = normal_01_moment ( order );

    fprintf ( 1, '  %6d  %14.6g\n', order, moment );

  end

  return
end
