<script lang="ts">
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { ScrollTrigger } from 'gsap/ScrollTrigger';

	let sectionRef: HTMLElement;
	let titleRef: HTMLElement;
	let descRef: HTMLElement;
	let contactCards: HTMLElement[] = [];
	let decorativeElements: HTMLElement[] = [];

	const contactInfo = [
		{
			type: 'Email',
			value: 'hello@nadisya.com',
			href: 'mailto:hello@nadisya.com',
			icon: '✉',
			color: '#f093fb'
		},
		{
			type: 'Instagram',
			value: '@nadisya.model',
			href: 'https://instagram.com/nadisya.model',
			icon: '📸',
			color: '#8b5cf6'
		},
		{
			type: 'WhatsApp',
			value: '+62 821 xxxx xxxx',
			href: 'https://wa.me/6282xxxxxxxx',
			icon: '💬',
			color: '#667eea'
		},
		{
			type: 'Location',
			value: 'Jakarta, Indonesia',
			href: '#',
			icon: '📍',
			color: '#ff6b6b'
		}
	];

	onMount(() => {
		gsap.registerPlugin(ScrollTrigger);

		// Create entrance animation timeline
		const tl = gsap.timeline({
			scrollTrigger: {
				trigger: sectionRef,
				start: 'top 70%',
				end: 'bottom 20%',
				toggleActions: 'play none none reverse'
			}
		});

		// Animate title with 3D effect
		tl.fromTo(
			titleRef,
			{
				y: 80,
				opacity: 0,
				rotationX: -30,
				transformOrigin: 'center bottom'
			},
			{
				y: 0,
				opacity: 1,
				rotationX: 0,
				duration: 1.2,
				ease: 'back.out(1.2)'
			}
		);

		// Animate description
		tl.fromTo(
			descRef,
			{ y: 40, opacity: 0 },
			{ y: 0, opacity: 1, duration: 0.8, ease: 'power2.out' },
			'-=0.6'
		);

		// Animate contact cards with stagger
		tl.fromTo(
			contactCards,
			{
				y: 60,
				opacity: 0,
				scale: 0.8,
				rotationY: -15
			},
			{
				y: 0,
				opacity: 1,
				scale: 1,
				rotationY: 0,
				duration: 0.8,
				stagger: 0.1,
				ease: 'back.out(1.1)'
			},
			'-=0.4'
		);

		// Animate decorative elements
		tl.fromTo(
			decorativeElements,
			{ scale: 0, opacity: 0, rotation: -180 },
			{
				scale: 1,
				opacity: 1,
				rotation: 0,
				duration: 1,
				stagger: 0.2,
				ease: 'back.out(1.4)'
			},
			'-=0.8'
		);

		// Add floating animation to decorative elements
		decorativeElements.forEach((el, index) => {
			gsap.to(el, {
				y: -10,
				duration: 2 + index * 0.5,
				repeat: -1,
				yoyo: true,
				ease: 'power2.inOut',
				delay: index * 0.3
			});
		});
	});

	const addCardRef = (element: HTMLElement) => {
		contactCards.push(element);
	};

	const addDecorativeRef = (element: HTMLElement) => {
		decorativeElements.push(element);
	};
</script>

<section bind:this={sectionRef} class="contact" id="contact">
	<div class="contact-container">
		<!-- Artistic Background -->
		<div class="contact-background">
			<div class="gradient-orb orb-1" use:addDecorativeRef></div>
			<div class="gradient-orb orb-2" use:addDecorativeRef></div>
			<div class="gradient-orb orb-3" use:addDecorativeRef></div>
		</div>

		<!-- Header Section -->
		<div class="contact-header">
			<h2 bind:this={titleRef} class="contact-title">
				<span class="title-main">Let's Create</span>
				<span class="title-accent">Something Beautiful</span>
			</h2>

			<p bind:this={descRef} class="contact-description">
				Ready to collaborate on your next project? I'd love to bring your creative vision to life
				through professional modeling and authentic storytelling.
			</p>
		</div>

		<!-- Contact Cards Grid -->
		<div class="contact-grid">
			{#each contactInfo as contact, index}
				<a
					href={contact.href}
					class="contact-card"
					use:addCardRef
					target={contact.type === 'Email' ? '_self' : '_blank'}
					rel="noopener noreferrer"
				>
					<div class="card-icon" style="color: {contact.color}">
						{contact.icon}
					</div>
					<div class="card-content">
						<span class="card-type">{contact.type}</span>
						<span class="card-value">{contact.value}</span>
					</div>
					<div class="card-arrow">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none">
							<path
								d="M4 10h12m-6-6l6 6-6 6"
								stroke="currentColor"
								stroke-width="2"
								stroke-linecap="round"
								stroke-linejoin="round"
							/>
						</svg>
					</div>
					<div
						class="card-glow"
						style="background: linear-gradient(135deg, {contact.color}33 0%, transparent 100%)"
					></div>
				</a>
			{/each}
		</div>

		<!-- Decorative Footer -->
		<div class="contact-footer">
			<div class="footer-decoration" use:addDecorativeRef>
				<div class="decoration-line"></div>
				<div class="decoration-dots">
					<div class="dot"></div>
					<div class="dot"></div>
					<div class="dot"></div>
				</div>
			</div>
			<p class="footer-text">Let's make magic happen together ✨</p>
		</div>
	</div>
</section>

<style>
	.contact {
		padding: 8rem 2rem;
		background: var(--color-background);
		position: relative;
		overflow: hidden;
		min-height: 100vh;
		display: flex;
		align-items: center;
	}

	.contact-container {
		max-width: var(--container-width);
		margin: 0 auto;
		position: relative;
		z-index: 2;
		width: 100%;
	}

	/* Artistic Background */
	.contact-background {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		pointer-events: none;
	}

	.gradient-orb {
		position: absolute;
		border-radius: 50%;
		filter: blur(80px);
		opacity: 0.6;
		animation: float 8s ease-in-out infinite;
	}

	.orb-1 {
		width: 300px;
		height: 300px;
		background: linear-gradient(135deg, #f093fb 0%, #ff6b6b 100%);
		top: 10%;
		left: 10%;
		animation-delay: 0s;
	}

	.orb-2 {
		width: 250px;
		height: 250px;
		background: linear-gradient(135deg, #8b5cf6 0%, #667eea 100%);
		bottom: 20%;
		right: 15%;
		animation-delay: 3s;
	}

	.orb-3 {
		width: 200px;
		height: 200px;
		background: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%);
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		animation-delay: 6s;
	}

	/* Header Section */
	.contact-header {
		text-align: center;
		margin-bottom: 6rem;
	}

	.contact-title {
		font-family: var(--font-serif);
		margin-bottom: 2rem;
		perspective: 1000px;
	}

	.title-main {
		display: block;
		font-size: clamp(3rem, 6vw, 5rem);
		font-weight: 400;
		color: var(--color-text);
		letter-spacing: -0.02em;
		margin-bottom: 0.5rem;
		line-height: 1;
	}

	.title-accent {
		display: block;
		font-size: clamp(2rem, 4vw, 3rem);
		font-weight: 300;
		background: linear-gradient(135deg, #f093fb 0%, #8b5cf6 50%, #667eea 100%);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
		background-clip: text;
		letter-spacing: 0.02em;
		position: relative;
	}

	.contact-description {
		font-family: var(--font-sans);
		font-size: 1.2rem;
		font-weight: var(--font-weight-light);
		line-height: 1.8;
		color: var(--color-text-muted);
		max-width: 600px;
		margin: 0 auto;
	}

	/* Contact Cards Grid */
	.contact-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
		gap: 2rem;
		margin-bottom: 6rem;
	}

	.contact-card {
		position: relative;
		background: var(--color-surface);
		border: 1px solid rgba(240, 147, 251, 0.2);
		border-radius: 20px;
		padding: 2rem;
		text-decoration: none;
		color: var(--color-text);
		transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
		overflow: hidden;
		transform-style: preserve-3d;
		cursor: none;
		backdrop-filter: blur(10px);
	}

	.contact-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: linear-gradient(
			135deg,
			rgba(240, 147, 251, 0.05) 0%,
			rgba(139, 92, 246, 0.05) 100%
		);
		opacity: 0;
		transition: opacity 0.3s ease;
	}

	.contact-card:hover::before {
		opacity: 1;
	}

	.contact-card:hover {
		transform: translateY(-8px) rotateX(5deg);
		border-color: rgba(240, 147, 251, 0.4);
		box-shadow: 0 20px 60px rgba(240, 147, 251, 0.2);
	}

	.card-icon {
		font-size: 2rem;
		margin-bottom: 1.5rem;
		transition: transform 0.3s ease;
	}

	.contact-card:hover .card-icon {
		transform: scale(1.1) rotate(5deg);
	}

	.card-content {
		margin-bottom: 1.5rem;
	}

	.card-type {
		display: block;
		font-family: var(--font-sans);
		font-size: 0.8rem;
		font-weight: var(--font-weight-semibold);
		letter-spacing: 0.1em;
		text-transform: uppercase;
		color: var(--color-text-light);
		margin-bottom: 0.5rem;
	}

	.card-value {
		display: block;
		font-family: var(--font-sans);
		font-size: 1.1rem;
		font-weight: var(--font-weight-medium);
		color: var(--color-text);
		transition: color 0.3s ease;
	}

	.contact-card:hover .card-value {
		color: var(--color-accent);
	}

	.card-arrow {
		position: absolute;
		top: 2rem;
		right: 2rem;
		color: var(--color-text-light);
		transition: all 0.3s ease;
		opacity: 0;
		transform: translateX(-10px);
	}

	.contact-card:hover .card-arrow {
		opacity: 1;
		transform: translateX(0);
		color: var(--color-accent);
	}

	.card-glow {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		opacity: 0;
		transition: opacity 0.3s ease;
		pointer-events: none;
	}

	.contact-card:hover .card-glow {
		opacity: 1;
	}

	/* Contact Footer */
	.contact-footer {
		text-align: center;
	}

	.footer-decoration {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 1rem;
		margin-bottom: 2rem;
	}

	.decoration-line {
		width: 60px;
		height: 1px;
		background: linear-gradient(90deg, transparent 0%, var(--color-accent) 50%, transparent 100%);
	}

	.decoration-dots {
		display: flex;
		gap: 0.5rem;
	}

	.dot {
		width: 6px;
		height: 6px;
		border-radius: 50%;
		background: var(--color-accent);
		animation: pulse 2s ease-in-out infinite;
	}

	.dot:nth-child(2) {
		animation-delay: 0.5s;
	}

	.dot:nth-child(3) {
		animation-delay: 1s;
	}

	.footer-text {
		font-family: var(--font-sans);
		font-size: 1rem;
		font-weight: var(--font-weight-light);
		color: var(--color-text-muted);
		font-style: italic;
	}

	/* Vibrant Theme Styles */
	:global([data-theme='vibrant']) .contact {
		background: var(--color-background);
	}

	:global([data-theme='vibrant']) .title-main {
		color: white;
	}

	:global([data-theme='vibrant']) .contact-description {
		color: rgba(255, 255, 255, 0.9);
	}

	:global([data-theme='vibrant']) .contact-card {
		background: rgba(255, 255, 255, 0.1);
		border-color: rgba(255, 255, 255, 0.2);
		backdrop-filter: blur(20px);
	}

	:global([data-theme='vibrant']) .contact-card:hover {
		background: rgba(255, 255, 255, 0.15);
		border-color: rgba(255, 255, 255, 0.4);
	}

	:global([data-theme='vibrant']) .card-type {
		color: rgba(255, 255, 255, 0.7);
	}

	:global([data-theme='vibrant']) .card-value {
		color: white;
	}

	:global([data-theme='vibrant']) .footer-text {
		color: rgba(255, 255, 255, 0.8);
	}

	/* Animations */
	@keyframes float {
		0%,
		100% {
			transform: translateY(0px) rotate(0deg);
		}
		33% {
			transform: translateY(-20px) rotate(5deg);
		}
		66% {
			transform: translateY(-10px) rotate(-5deg);
		}
	}

	@keyframes pulse {
		0%,
		100% {
			opacity: 1;
			transform: scale(1);
		}
		50% {
			opacity: 0.5;
			transform: scale(1.2);
		}
	}

	/* Mobile Responsive */
	@media (max-width: 768px) {
		.contact {
			padding: 4rem 1rem;
		}

		.contact-header {
			margin-bottom: 4rem;
		}

		.contact-grid {
			grid-template-columns: 1fr;
			gap: 1.5rem;
			margin-bottom: 4rem;
		}

		.contact-card {
			padding: 1.5rem;
		}

		.title-main {
			font-size: 2.5rem;
		}

		.title-accent {
			font-size: 1.8rem;
		}

		.contact-description {
			font-size: 1rem;
		}

		.gradient-orb {
			display: none;
		}
	}
</style>
