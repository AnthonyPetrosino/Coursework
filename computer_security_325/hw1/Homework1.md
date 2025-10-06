# Anthony Petrosino
Reviewed answers with Sean Baker.

## Computer Security: Homework 1
### 1. Classify each of the following as a violation of confidentiality, integrity, availability, or a combination.
    a. John copies Mary's Homework. 
        Confidentiality: John gained unauthorized access to Mary's work.
    b. Paul crashes Linda's system.
        Availability: The system becomes unavailable.
    c. Carol changes the amount of Angelo's check from 100 to 1,000.
        Integrity violation: Carol was unauthorized to manipulate the data.
    d. Rhonda registers the domain name “Pearson.com” and refuses to let the publishing house buy or use that domain name.
        Availability: Rhonda prevents the rightful owner of the domain from gaining access. 
    e. Henry spoofs Julie’s IP address to gain access to her computer.
	    Confidentiality: Henry is breaking into a computer in order to access information that he is not authorized to have.

### 2.  A policy might state that only faculty and staff may use electronic mail on a particular system; students are not allowed to send or receive electronic mail on that host. Let Q be the set of secure states (as specified by the security policy). Let the security mechanisms restrict the system to some set of states R (thus, R ⊆ P ). A security mechanism is secure if R ⊆ Q; it is precise if R = Q; and it is broad if there are states r such that r ∈ R and r /∈ Q. Now consider the following possible mechanisms to enforce the above policy. For each, classify it as secure, precise, or broad, and explain briefly why.

    a. The electronic mail sending and receiving programs are disabled.
        Secure: Since no programs are allowed, no unauthorized functionality can occur. Therefore, it is secure but not precise, making it overly restrictive as R contains all states in Q but there are states in R not included in Q.
    b. As each letter is sent or received, the system looks up the sender (or recipient) in a database. If that party is listed as faculty or staff, the mail is processed. Otherwise, it is rejected. (Assume that the database entries are correct.)
        Precise: This fulfills the policy requirements of allowing only staff to send/receive mail. Since this is all the mechanism does and all that the policy wants, R = Q.
    c. The electronic mail sending programs ask the user if he or she is a student. If so, the mail is refused. The electronic mail receiving programs are disabled.
        Broad and not secure: The lack of receiving functionality makes it broad as it restricts more than required in that sense. While this hypothetically prevents students from sending messages, it does nothing to enforce this as a student can very easily pose as a staff member, making it easy for it to enter an unsecure state.

### 3. How do laws protecting privacy impact the ability of system administrators to monitor user activity?

    Laws protecting privacy might prevent system administrators from monitoring certain user activity within a system. For example, if a system administrator controls a network, they might not be allowed to monitor personal communications that happen to be sent over the network without user consent. System administrators must ensure that any monitoring is done in a way that respects user privacy. This can create challenges for system administrators who need to balance security needs with legal and ethical considerations as it can be difficult to draw the line between what user activity should be private.

