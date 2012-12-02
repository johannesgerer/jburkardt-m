function pdf = dirichlet_mix_pdf ( x, comp_num, elem_num, a, comp_weight )

%*****************************************************************************80
%
%% DIRICHLET_MIX_PDF evaluates a Dirichlet mixture PDF.
%
%  Discussion:
%
%    The PDF is a weighted sum of Dirichlet PDF's.  Each PDF is a
%    "component", with an associated weight.
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
%    Input, real X(ELEM_NUM), the argument of the PDF.
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
%    Output, real PDF, the value of the PDF.
%
  comp_weight_sum = sum ( comp_weight );

  pdf = 0.0;
  for comp_i = 1 : comp_num

    comp_pdf = dirichlet_pdf ( x, elem_num, a(1:elem_num,comp_i) );

    pdf = pdf + comp_weight(comp_i) * comp_pdf / comp_weight_sum;

  end

  return
end
