function hello_fun ( n )

%*****************************************************************************80
%
%% HELLO_FUN uses MATLAB's PARFOR command to print "Hello, world!".
%
%  Discussion:
%
%    This trivial program may help when first trying out MATLAB's
%    parallel features.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of times to say hello.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HELLO_FUN:\n' );
  fprintf ( 1, '  Print lots of hellos.\n' );
  fprintf ( 1, '\n' );

  parfor i = 1 : n
    fprintf ( 1, '  %d: Hello, world!\n', i );
  end

  return
end


