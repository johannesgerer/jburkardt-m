function value = p00_r8vec ( problem, action, name, dim_num, value )

%*****************************************************************************80
%
%% P00_R8VEC sets or gets R8VEC parameters for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the desired test problem.
%
%    Input, string ACTION, the action.
%    'D' sets the  object to a default value.
%    'G' means the current value of the object should be returned.
%    'R' means randomize the object and return it.
%    'S' means the object should be set to VALUE.
%
%    Input, string NAME, the name of the variable.
%
%    Input, integer DIM_NUM, the dimension of the variable.
%
%    Input/output, real VALUE(DIM_NUM), the value of the variable.
%
  if ( problem == 1 )

  elseif ( problem == 2 )

  elseif ( problem == 3 )

  elseif ( problem == 4 )

  elseif ( problem == 5 )

  elseif ( problem == 6 )

  elseif ( problem == 7 )

  elseif ( problem == 8 )

  elseif ( problem == 9 )
    value = p09_r8vec ( action, name, dim_num, value );
  elseif ( problem == 10 )

  elseif ( problem == 11 )

  elseif ( problem == 12 )

  elseif ( problem == 13 )

  elseif ( problem == 14 )

  elseif ( problem == 15 )

  elseif ( problem == 16 )
    value = p16_r8vec ( action, name, dim_num, value );
  elseif ( problem == 17 )
    value = p17_r8vec ( action, name, dim_num, value );
  elseif ( problem == 18 )
    value = p18_r8vec ( action, name, dim_num, value );
  elseif ( problem == 19 )
    value = p19_r8vec ( action, name, dim_num, value );
  elseif ( problem == 20 )

  elseif ( problem == 21 )

  elseif ( problem == 22 )

  elseif ( problem == 23 )

  elseif ( problem == 24 )
    value = p24_r8vec ( action, name, dim_num, value );
  elseif ( problem == 25 )

  elseif ( problem == 26 )
    value = p26_r8vec ( action, name, dim_num, value );
  elseif ( problem == 27 )
    value = p27_r8vec ( action, name, dim_num, value );
  elseif ( problem == 28 )
    value = p28_r8vec ( action, name, dim_num, value );
  elseif ( problem == 29 )
    value = p29_r8vec ( action, name, dim_num, value );
  elseif ( problem == 30 )
    value = p30_r8vec ( action, name, dim_num, value );
  elseif ( problem == 31 )
    value = p31_r8vec ( action, name, dim_num, value );
  elseif ( problem == 32 )
    value = p32_r8vec ( action, name, dim_num, value );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_R8VEC - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_R8VEC - Fatal error!' );
  end

  return
end
