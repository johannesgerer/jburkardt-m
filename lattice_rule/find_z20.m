function z = find_z20 ( dim_num, m )

%*****************************************************************************80
%
%% FIND_Z20 finds the appropriate Z vector to minimize P2(QS).
%
%  Discussion:
%
%    For the method of good lattice points, a number of points M, and
%    a single generator vector Z is chosen.  The integrand is assumed
%    to be periodic of period 1 in each argument, and is evaluated at
%    each of the points X(I)(1:DIM_NUM) = I * Z(1:DIM_NUM) / M,
%    for I = 0 to M-1.  The integral is then approximated by the average
%    of these values.
%
%    Assuming that DIM_NUM and M are known, and that the integrand is not
%    known beforehand, the accuracy of the method depends entirely
%    on the choice of Z.  One method of choosing Z is to search for
%    the Z among all candidates which minimizes a particular quantity
%    P_ALPHA(QS).
%
%    We only need to look at vectors Z of the form
%    (1, L, L^2, ..., L^(DIM_NUM-1)),
%    for L = 1 to M/2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994,
%    ISBN: 0198534728,
%    LC: QA311.S56
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer M, the number of points to be used.
%
%    Output, integer Z(DIM_NUM), the optimal vector.
%
  q0_min = Inf;

  for l = 1 : floor ( m / 2 )

    value = 1;
    for i = 1 : dim_num
      z(i) = value;
      value = mod ( value * l, m );
    end
%
%  Use this Z and the lattice integral method Q0 of order M,
%  to approximate the integral of P2.
%
    q0 = lattice ( dim_num, m, z, @f20_s );
%
%  If this result is the smallest so far, save the corresponding Z.
%
    if ( q0 < q0_min )
      q0_min = q0;
      z_min(1:dim_num) = z(1:dim_num);
    end

  end
%
%  Return the best Z.
%
  z(1:dim_num) = z_min(1:dim_num);

  return
end
