package com.monomarket.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BuybackRequestForm {

  @NotBlank(message = "ISBN/JAN cannot be blank")
  @Size(max = 50, message = "ISBN/JAN cannot be longer than 50 characters")
  private String submittedIsbnOrJan;

  @NotBlank(message = "Please select a condition rank")
  @Pattern(regexp = "[SABC]", message = "Condition rank must be S, A, B or C")
  private String userConditionRank;

  @Size(max = 1000, message = "Description cannot be longer than 1000 characters")
  private String description;

  @NotBlank(message = "Handover address cannot be blank")
  @Size(max = 500, message = "Handover address cannot be longer than 500 characters")
  private String handoverAddress;

  @NotNull(message = "Please select a preferred handover date")
  @FutureOrPresent(message = "Preferred handover date cannot be in the past")
  private LocalDate preferredHandoverDate;
}
