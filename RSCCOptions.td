//===----------------------------------------------------------------------===//
//
//  This file defines the options accepted by llvm-rs-cc.
//
//===----------------------------------------------------------------------===//

// Include the common option parsing interfaces.
include "clang/Driver/OptParser.td"

//===----------------------------------------------------------------------===//
// Target Options
//===----------------------------------------------------------------------===//

def target_cpu : Separate<"-target-cpu">,
  HelpText<"Target a specific cpu type">;
def _target_cpu : Flag<"-u">, Alias<target_cpu>;
def target_feature : Separate<"-target-feature">,
  HelpText<"Target specific attributes">;
def triple : Separate<"-triple">,
  HelpText<"Specify target triple (e.g. i686-apple-darwin9)">;
def triple_EQ : Joined<"-triple=">, Alias<triple>;
def _triple : Separate<"-t">, Alias<triple>;

//===----------------------------------------------------------------------===//
// Header Search Options
//===----------------------------------------------------------------------===//

def I : JoinedOrSeparate<"-I">, MetaVarName<"<directory>">,
  HelpText<"Add directory to include search path">;
def _I : Separate<"include-path">, MetaVarName<"<directory>">, Alias<I>;

//===----------------------------------------------------------------------===//
// Frontend Options
//===----------------------------------------------------------------------===//

def o : Separate<"-o">, MetaVarName<"<directory>">,
  HelpText<"Specify output directory">;

def Output_Type_Group : OptionGroup<"<output type group>">;
let Group = Output_Type_Group in {

def emit_asm : Flag<"-emit-asm">,
  HelpText<"Emit target assembly files">;
def _emit_asm : Flag<"-S">, Alias<emit_asm>;
def emit_llvm : Flag<"-emit-llvm">,
  HelpText<"Build ASTs then convert to LLVM, emit .ll file">;
def emit_bc : Flag<"-emit-bc">,
  HelpText<"Build ASTs then convert to LLVM, emit .bc file">;
def emit_nothing : Flag<"-emit-nothing">,
  HelpText<"Build ASTs then convert to LLVM, but emit nothing">;
}

def allow_rs_prefix : Flag<"-allow-rs-prefix">,
  HelpText<"Allow user-defined function prefixed with 'rs'">;

def java_reflection_path_base : Separate<"-java-reflection-path-base">,
  MetaVarName<"<directory>">,
  HelpText<"Base directory for output reflected Java files">;
def _java_reflection_path_base : Separate<"-p">,
  Alias<java_reflection_path_base>;
def java_reflection_package_name : Separate<"-java-reflection-package-name">,
  HelpText<"Specify the package name that reflected Java files belong to">;
def _java_reflection_package_name : Separate<"-j">,
  Alias<java_reflection_package_name>;

def bitcode_storage : Separate<"-bitcode-storage">,
  MetaVarName<"<value>">, HelpText<"<value> should be 'ar' or 'jc'">;
def _bitcode_storage : Separate<"-s">, Alias<bitcode_storage>;

//===----------------------------------------------------------------------===//
// Dependency Output Options
//===----------------------------------------------------------------------===//

def M_Group : OptionGroup<"M group>">;
let Group = M_Group in {

  def MD : Flag<"-MD">;

  def M : Flag<"-M">;
  def emit_dep : Flag<"-emit-dep">, Alias<M>;
}

def output_dep_dir : Separate<"-output-dep-dir">, MetaVarName<"<directory>">,
  HelpText<"Specify output directory for dependencies output">;
def _output_dep_dir : Separate<"-d">, Alias<output_dep_dir>;

def additional_dep_target: Separate<"-additional-dep-target">,
  HelpText<"Additional targets to show up in dependencies output">;
def _additional_dep_target : Separate<"-a">, Alias<additional_dep_target>;

//===----------------------------------------------------------------------===//
// Misc Options
//===----------------------------------------------------------------------===//

def help : Flag<"-help">,
  HelpText<"Print this help text">;
def _help : Flag<"--help">, Alias<help>;
def __help : Flag<"-h">, Alias<help>;

def version : Flag<"-version">,
  HelpText<"Print the assembler version">;
def _version : Flag<"--version">, Alias<version>;

// Compatible with old slang
def no_link : Flag<"-no-link">;  // currently no effect