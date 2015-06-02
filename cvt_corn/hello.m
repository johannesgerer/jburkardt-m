function hello ( )

%*****************************************************************************80
%
%% HELLO issues an initial message to the user.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_CORN:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Simulate the growth of a corn kernel.\n' );

  return
end
