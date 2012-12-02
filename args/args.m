function args ( varargin )

%*****************************************************************************80
%
%% ARGS demonstrates how a MATLAB procedure can examine its arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, VARARGIN, a variable length list of arguments.  The
%    actual values should be separated by commas.
%
  timestamp ( );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARGS\n' );
  fprintf ( 1, '  Demonstrate methods of checking input arguments.\n' );
  fprintf ( 1, '  NARGIN counts arguments.\n' );
  fprintf ( 1, '  VARARGIN allows a variable number of input arguments.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use this routine by making a call with any number of\n' );
  fprintf ( 1, '  comma-separated arguments.  For this demonstration,\n' );
  fprintf ( 1, '  please only use quoted strings as arguments, such as:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    args ( ''Bob'', ''Fred'', ''String'' )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of input arguments was %d.\n', nargin );
  fprintf ( 1, '\n' );
  for i = 1 : nargin
      fprintf ( 1, '  Argument %d is %s\n', i, varargin{i} );
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARGS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
