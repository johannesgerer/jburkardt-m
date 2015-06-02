function i4_uniform_0i_test ( )

%*****************************************************************************80
%
%% I4_UNIFORM_0I_TEST tests I4_UNIFORM_0I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 June 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_UNIFORM_0I_TEST\n' );
  fprintf ( 1, '  I4_UNIFORM_0I computes pseudorandom integers\n' );
  fprintf ( 1, '  in the interval [1,(2^31)-1].\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    seed = i4_uniform_0i ( seed );
    fprintf ( 1, '  %12d  %d\n', i, seed );
  end

  return
end
