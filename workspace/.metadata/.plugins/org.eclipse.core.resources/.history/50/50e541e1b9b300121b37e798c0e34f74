################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/read_write_DRAM.c \
../src/readbgcop.c \
../src/writecopimage.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/read_write_DRAM.o \
./src/readbgcop.o \
./src/writecopimage.o 

C_DEPS += \
./src/read_write_DRAM.d \
./src/readbgcop.d \
./src/writecopimage.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo Building file: $<
	@echo Invoking: MicroBlaze gcc compiler
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -Wl,--no-relax -I../../read_write_DRAM_bsp_0/microblaze_0/include -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.30.a -mno-xl-soft-mul -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo Finished building: $<
	@echo ' '


