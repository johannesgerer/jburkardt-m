function nvar = p10_nvar ( option )

%*****************************************************************************80
%
%% P10_NVAR sets the number of variables for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Output, integer NVAR, the number of variables.
%
  nrow = 6;
  ncol = 6;
  nvar = nrow * ncol + 1;

  return
end
