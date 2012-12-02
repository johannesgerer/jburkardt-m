function persist ( )

%*****************************************************************************80
%
%  PERSIST demonstrates the use of a peristent variable.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PERSIST\n' );
  fprintf ( 1, '  Demonstrate how a PERSISTENT variable can be used\n' );
  fprintf ( 1, '  in a lower level function, to store a value between calls.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  Plus Total\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    j = floor ( 10 * rand ( ) );
    total = sumup ( j );
    fprintf ( 1, '  %4d  %4d  %4d\n', i, j, total );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PERSIST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function total = sumup ( arg )

%*****************************************************************************80
%
%  SUMUP adds the input argument to an internal total and returns the new value.
%
%  Discussion:
%
%    The point of this function is simply to illustrate how a persistent
%    variable can be used to retain a value within a function between calls.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ARG, the value to be added to the total.
%
%    Output, real VALUE, the running total.
%
%  Local parameters:
%
%    Local, real VALUE, an internal persistent variable which records the
%    current running total.
%
  persistent value;

  if ( isempty ( value ) )
    value = 0;
  end

  value = value + arg;

  total = value;

  return
end
