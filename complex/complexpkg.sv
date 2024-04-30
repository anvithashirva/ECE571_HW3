package complexpkg;

typedef struct {
shortreal Real;
shortreal Imaginary;
} complex;

//function to add floating point complex numbers
function automatic complex AddComplex(input complex M, N);
	complex AddResult;
	AddResult.Real = (M.Real+N.Real);
	AddResult.Imaginary = (M.Imaginary+N.Imaginary);
	return AddResult;
endfunction

//function to multiply floatinig point complex numbers
function automatic complex MultComplex(input complex M, N);
	complex MultResult;
	MultResult.Real = ((M.Real * N.Real) - (M.Imaginary * N.Imaginary)) ;
	MultResult.Imaginary = (M.Real * N.Imaginary) + (M.Imaginary * N.Real) ;
	return MultResult;
endfunction

//function to create complex numbers
function automatic complex CreateComplex(input shortreal RealPart, ImaginaryPart);
	complex CreateFPC;
	CreateFPC.Real = RealPart;
	CreateFPC.Imaginary = ImaginaryPart;
	return CreateFPC;
endfunction

//function to print complex numbers
function void PrintComplex(input complex C);
	$display("r: %g, i: %g",C.Real,C.Imaginary);
endfunction

//function to return components of complex numbers
function void ComplexToComponents(input complex C, output shortreal RealPart, ImaginaryPart);
	RealPart = C.Real;
	ImaginaryPart = C.Imaginary;
endfunction
	
endpackage
