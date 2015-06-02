function comp_enum_test ( )

%*****************************************************************************80
%
%% COMP_ENUM_TEST tests COMP_ENUM;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP_ENUM_TEST\n' );
  fprintf ( 1, '  COMP_ENUM counts compositions;\n' );
  fprintf ( 1, '\n' );
  for n = 0 : 10
    for k = 1 : 10
      num = comp_enum ( n, k );
      fprintf ( 1, '  %6d', num );
    end
    fprintf ( 1, '\n' );
  end

  return
end
