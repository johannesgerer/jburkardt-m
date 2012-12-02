function n = simplex_unit_lattice_point_num_nd ( d, s )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_LATTICE_POINT_NUM_ND counts lattice points.
%
%  Discussion:
%
%    The simplex is assumed to be the unit D-dimensional simplex:
%
%    ( (0,0,...,0), (1,0,...,0), (0,1,...,0), ... (0,,0,...,1) )
%
%    or a copy of this simplex scaled by an integer S:
%
%    ( (0,0,...,0), (S,0,...,0), (0,S,...,0), ... (0,,0,...,S) )
%
%    The routine returns the number of integer lattice points that appear
%    inside the simplex or on its boundary.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Matthias Beck, Sinai Robins,
%    Computing the Continuous Discretely,
%    Springer, 2006,
%    ISBN13: 978-0387291390,
%    LC: QA640.7.B43.
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer S, the scale factor.
%
%    Output, integer N, the number of lattice points.
%
  n = 1;
  for i = 1 : d
    n = ( n * ( s + i ) ) / i;
  end

  return
end
