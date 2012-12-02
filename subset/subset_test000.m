function subset_test000 ( )

%*****************************************************************************80
%
%% TEST000 tests RANDOM_INITIALIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n');
  fprintf ( 1, 'TEST000\n');
  fprintf ( 1, '  Call RANDOM_INITIALIZE to initialize the\n');
  fprintf ( 1, '  random number generator.\n');

  seed = 0;
  random_initialize ( seed );

  return
end
