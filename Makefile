.PHONY: clean All

All:
	@echo "----------Building project:[ CarND-PID-Control-Project - Debug ]----------"
	@"$(MAKE)" -f  "CarND-PID-Control-Project.mk"
clean:
	@echo "----------Cleaning project:[ CarND-PID-Control-Project - Debug ]----------"
	@"$(MAKE)" -f  "CarND-PID-Control-Project.mk" clean
