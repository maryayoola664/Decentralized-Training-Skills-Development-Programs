# Decentralized Training Skills Development Programs

A comprehensive blockchain-based system for managing skills development programs using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized approach to skills training and development, featuring coordinator verification, competency mapping, gap analysis, development planning, and progress measurement.

## Architecture

### Smart Contracts

1. **Skills Coordinator Contract** (`skills-coordinator.clar`)
    - Verifies and manages skills development coordinators
    - Tracks coordinator statistics and performance
    - Ensures only authorized coordinators can manage programs

2. **Competency Mapping Contract** (`competency-mapping.clar`)
    - Defines and manages competencies across different categories
    - Maps competencies to specific roles and positions
    - Maintains prerequisite relationships between competencies

3. **Gap Analysis Contract** (`gap-analysis.clar`)
    - Assesses current user competency levels
    - Identifies gaps between current and required skills
    - Prioritizes development areas based on role requirements

4. **Development Planning Contract** (`development-planning.clar`)
    - Creates personalized development plans
    - Defines learning paths and resources
    - Manages activities and milestones

5. **Progress Measurement Contract** (`progress-measurement.clar`)
    - Tracks progress against development plans
    - Records milestone completions
    - Awards achievements and certifications

## Key Features

- **Decentralized Verification**: Coordinator verification without central authority
- **Competency Framework**: Structured approach to skills mapping
- **Gap Analysis**: Automated identification of skills gaps
- **Personalized Planning**: Tailored development plans for each user
- **Progress Tracking**: Real-time monitoring of development progress
- **Achievement System**: Recognition and certification of completed competencies

## Data Structures

### Coordinator Data
- Verification status and date
- Specialization area
- Experience level
- Performance statistics

### Competency Data
- Name and description
- Category and difficulty level
- Prerequisites
- Creation metadata

### Development Plan Data
- Target competencies
- Learning path and resources
- Timeline and milestones
- Status tracking

### Progress Data
- Initial, current, and target levels
- Progress percentage
- Milestone completions
- Achievements earned

## Usage Examples

### Verify a Coordinator
\`\`\`clarity
(contract-call? .skills-coordinator verify-coordinator
'SP1234567890ABCDEF
"Software Development"
u5)
\`\`\`

### Create a Competency
\`\`\`clarity
(contract-call? .competency-mapping create-competency
"JavaScript Programming"
"Proficiency in JavaScript language and frameworks"
"Programming"
u3
(list u1 u2))
\`\`\`

### Record Progress
\`\`\`clarity
(contract-call? .progress-measurement record-progress
'SP1234567890ABCDEF
u1
u1
u2
u6
u8)
\`\`\`

## Security Considerations

- Only verified coordinators can create development plans
- Progress can only be recorded by authorized assessors
- All actions are recorded on-chain for transparency
- Role-based access control throughout the system

## Testing

Tests are written using Vitest and cover all major contract functions:
- Coordinator verification flows
- Competency creation and mapping
- Gap analysis processes
- Development plan management
- Progress tracking and achievements

## Deployment

Deploy contracts in the following order:
1. skills-coordinator.clar
2. competency-mapping.clar
3. gap-analysis.clar
4. development-planning.clar
5. progress-measurement.clar

## Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

MIT License - see LICENSE file for details

