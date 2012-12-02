function mean = dirichlet_mix_mean ( comp_num, elem_num, a, comp_weight )

%*****************************************************************************80
%
%% DIRICHLET_MIX_MEAN returns the means of a Dirichlet mixture PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer COMP_NUM, the number of components in the Dirichlet
%    mixture density, that is, the number of distinct Dirichlet PDF's
%    that are mixed together.
%
%    Input, integer ELEM_NUM, the number of elements of an observation.
%
%    Input, real A(ELEM_NUM,COMP_NUM), the probabilities for
%    element ELEM_NUM in component COMP_NUM.
%    Each A(I,J) should be positive.
%
%    Input, real COMP_WEIGHT(COMP_NUM), the mixture weights of the densities.
%    These do not need to be normalized.  The weight of a given component is
%    the relative probability that that component will be used to generate
%    the sample.
%
%    Output, real MEAN(ELEM_NUM), the means for each element.
%
  comp_weight_sum = sum ( comp_weight );

  mean(1:elem_num) = 0.0;

  for comp_i = 1 : comp_num
    comp_mean(1:elem_num) = dirichlet_mean ( elem_num, a(1:elem_num,comp_i) );
    mean(1:elem_num) = mean(1:elem_num) ...
      + comp_weight(comp_i) * comp_mean(1:elem_num);
  end

  mean(1:elem_num) = mean(1:elem_num) / comp_weight_sum;

  return
end
