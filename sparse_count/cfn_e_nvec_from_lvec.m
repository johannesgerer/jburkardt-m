function nvec = cfn_e_nvec_from_lvec ( lvec )

%*****************************************************************************80
%
%% CFN_E_NVEC_FROM_LVEC converts 1D levels to sizes for the CFN_E family.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LVEC(M), the 1D indices.
%
%    Output, integer NVEC(M), the 1D sizes.
%
  i = find ( lvec == 0 );
  j = find ( lvec ~= 0 );
  nvec(i) = 1;
  nvec(j) = 2.^lvec(j) + 1;

  return
end
